import 'package:abstracts/core/network/_network.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      contentType: Endpoints.connectionType,
      connectTimeout: Endpoints.connectionTimeout,
      receiveTimeout: Endpoints.receiveTimeout,
    ),
  );

  Future<void> setup() async {
    final Interceptors interceptors = dio.interceptors;

    interceptors.clear();

    interceptors.addAll([
      ConnectionInterceptor(),
      // ALogInterceptor(),
      LoggerInterceptor(),
    ]);
  }
}
