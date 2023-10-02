part of 'main.dart';

class AMultiBlocProvider extends StatelessWidget {
  const AMultiBlocProvider({super.key, required this.app});

  final Widget app;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => PostCubit(),
      ),
      BlocProvider(
        create: (context) =>
            RickAndMortyBloc(repo: RepositoryProvider.of<RickRepo>(context)),
      ),
      BlocProvider(
        create: (context) =>
            JsonPhdBBloc(repo: RepositoryProvider.of<JsonPHDRepo>(context)),
      ),
    ], child: app);
  }
}
