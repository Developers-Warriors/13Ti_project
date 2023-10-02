part of 'main.dart';

class AMultiRepoProvider extends StatelessWidget {
  const AMultiRepoProvider({super.key, required this.aMultiBlocProvider});

  final AMultiBlocProvider aMultiBlocProvider;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              RickRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) =>
              JsonPHDRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: aMultiBlocProvider,
    );
  }
}
