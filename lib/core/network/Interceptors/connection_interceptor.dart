// ignore_for_file: deprecated_member_use

import 'package:abstracts/core/network/_network.dart';
import 'package:abstracts/core/ui/widgets/error_page.dart';
import 'package:abstracts/feature/go_router/widgets/navigatorKey.dart';
import 'package:flutter/material.dart';

class ConnectionInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.connectionTimeout ||
        err.type == DioErrorType.connectionError ||
        err.type == DioErrorType.unknown
        ) {
      Navigator.push(
        navigatorKey!.currentContext!,
        MaterialPageRoute(
          builder: (_) => ErrorPage(),
        ),
      );
    }
    return super.onError(err, handler);
  }
}
