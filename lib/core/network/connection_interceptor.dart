// import 'package:dio/dio.dart';
// // import 'package:lender_invest/core/storage/_storage.dart';
// // import 'package:restart_app/restart_app.dart';

// class ConnectionInterceptor extends Interceptor {
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     if (err.type == DioErrorType.connectionTimeout ||
//         err.type == DioErrorType.connectionError ||
//         err.type == DioErrorType.unknown) {
//       // SharedPrefs.clear();
//       // SharedPrefs.setIsOnboardingHasShowen(isOnboardingHasShowen: true);
//       // Restart.restartApp();
//     }
//     // if (err.response!.statusCode == 401) {
//     //   SharedPrefs.clear();
//     //   SharedPrefs.setIsOnboardingHasShowen(isOnboardingHasShowen: true);
//     //   Restart.restartApp();
//     // }
//     return super.onError(err, handler);
//   }
// }
