import 'package:dio/dio.dart';
import '../dio_error_handler.dart';

class ErrorInterceptor extends Interceptor {

  // Only cares about errors
  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    print('✗ ERROR: ${err.response?.statusCode} ${err.message}');
    print('✗ DATA:  ${err.response?.data}');

    // Convert DioException → your AppException
    final exception = DioErrorHandler.handle(err);

    // Reject with your custom exception
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response:       err.response,
        type:           err.type,
        error:          exception, // 👈 your AppException attached
      ),
    );
  }
}