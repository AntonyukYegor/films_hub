import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this.onErrorHandler);

  static const String _unknownStatusName = 'unknown';

  final Function(String, String) onErrorHandler;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    onErrorHandler(
      err.response?.statusCode?.toString() ?? _unknownStatusName,
      err.message,
    );
    _sendToCrashlytics(err);
    handler.next(err);
  }

  void _sendToCrashlytics(DioError err) {
    final customKeys = <String, String>{
      'url': err.requestOptions.uri.host,
      'path': err.requestOptions.uri.path,
      'response_type': err.requestOptions.responseType.toString(),
      'query_params': err.requestOptions.queryParameters.toString(),
    };
    for (final k in customKeys.keys) {
      FirebaseCrashlytics.instance.setCustomKey(k, customKeys[k] ?? '-');
    }
    FirebaseCrashlytics.instance.recordError(
      err.message,
      err.stackTrace,
      printDetails: true,
    );
  }
}
