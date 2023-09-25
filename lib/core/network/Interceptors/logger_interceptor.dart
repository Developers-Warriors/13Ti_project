import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final _logger = Logger(
    filter: _LogFilter(),
    printer: _LogPrinter('LOGGER'),
    output: _LogOutput(
      [
        ConsoleOutput(),
      ],
    ),
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) => throw err;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final base = response.requestOptions;
    final headers =
        base.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
    var level = Level.info;
    if ((response.statusCode ?? 0) >= 400) {
      level = Level.error;
    }
    _logger.log(level,
        'RESPONSE 🚩 <- ${response.statusCode} ${base.method} ${base.uri}\n$headers');
    if (response.data != null) {
      _logger.log(level, response.data);
    }
    _logger.log(level, 'RESPONSE END');
    handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final headers =
          options.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
      _logger.i('REQUEST -> ${options.method} ${options.uri}\n$headers');
      if (options.data != null) {
        _logger.i(options.data);
      }
      _logger.i('REQUEST END 🎇');
    } catch (e) {
      _logger.e(e);
    }
    handler.next(options);
  }
}

class _LogPrinter extends PrettyPrinter {
  final String className;

  _LogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    var output = '$emoji $className - ${event.message}';
    final result = <String>[];
    for (var line in output.split('\n')) {
      result.add(line);
    }

    return result;
  }
}

class _LogOutput extends LogOutput {
  final List<LogOutput> logOutputs;

  _LogOutput(this.logOutputs);

  @override
  void output(OutputEvent event) {
    for (var logOutput in logOutputs) {
      logOutput.output(event);
    }
  }
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}
