import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    _logger.i('${options.method} request ==> $requestPath');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      '✅ RESPONSE\n'
      'STATUS: ${response.statusCode}\n'
      'MESSAGE: ${response.statusMessage}\n'
      'DATA: ${response.data}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final requestPath = '${err.requestOptions.baseUrl}${err.requestOptions.path}';
    _logger.e('❌ ERROR on ${err.requestOptions.method} ==> $requestPath');
    _logger.d('Error type: ${err.type}\nMessage: ${err.message}');
    handler.next(err);
  }
}

class AuthorizationInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
