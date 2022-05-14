import 'package:dio/dio.dart';

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
    handler.next(err);
  }
}
