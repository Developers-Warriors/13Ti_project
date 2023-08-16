// import 'package:abstracts/feature/go_router/pages/go_router.dart';
// import 'package:abstracts/feature/go_router/widgets/app_routes.dart';
// import 'package:abstracts/feature/hive/pages/hive.dart';
import 'package:flutter/material.dart';
// import 'feature/go_router/widgets/navigatorKey.dart';
import 'core/ui/widgets/awesome_snackbar_content.dart';
import 'feature/go_router/widgets/navigatorKey.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
// import 'feature/hive/pages/hive.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('shop_box');
  await Hive.openBox('box');
  // await Hive.openBox<Transaction>('transaction');
  // Hive.registerAdapter(TransactionAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      // navigatorKey: locator,
      navigatorKey: navigatorKey,
      // routes: AppRoutes,
      // initialRoute: "HomeScreens",
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ru'), Locale('kg')],
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: AwesomeSnackbarContentWidgets(),
    );
  }
}
