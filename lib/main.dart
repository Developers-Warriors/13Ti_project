
//* package
import 'package:abstracts/feature/testings_api/pages/json_phd.dart';
import 'package:abstracts/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//* feature
import 'package:abstracts/feature/_feature.dart';
import 'package:abstracts/core/ui/_ui.dart';
import 'package:abstracts/core/network/_network.dart';
import 'feature/go_router/widgets/navigatorKey.dart';


//*
part 'app.dart';
part 'a_multi_repository_provider.dart';
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
    const AMultiRepoProvider(
      aMultiBlocProvider: AMultiBlocProvider(app: MyApp()),
    ),
  );
}
