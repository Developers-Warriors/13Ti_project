import 'package:abstracts/core/ui/_ui.dart';
import 'package:abstracts/feature/_feature.dart';
import 'package:abstracts/feature/dio_settings/state/cubit/post_cubit.dart';
import 'package:abstracts/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'feature/dio_settings/pages/_pages.dart';

import 'feature/go_router/widgets/navigatorKey.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
part 'app.dart';
part 'a_multi_bloc_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // PostRepo postRepo = PostRepo();
  // List<PostModel> postModels = await postRepo.fetchPost();
  // log(postModels.toString());
  // await Hive.initFlutter();
  // await Hive.openBox('shop_box');
  // await Hive.openBox('box');
  runApp(
    AMultiBlocProvider(
      app: MyApp(),
    ),
  );
}
