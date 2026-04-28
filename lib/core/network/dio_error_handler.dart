import 'package:bloging_app/core/error/exception.dart';
import 'package:dio/dio.dart';

class DioErrorHandler {
  DioErrorHandler._();

  static AppException handle(Object error) {
    if (error is DioException) {
      return _fromDioException(error);
    }
    if (error is AppException) {
      return error;
    }
    return UnknownException(message: error.toString());
  }

  static AppException _fromDioException(DioException e) {
    switch (e.type) {

      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'No internet connection. Please check your network.',
        );

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException(
          message: 'Request timed out. Please try again.',
        );

      case DioExceptionType.cancel:
        return const UnknownException(
          message: 'Request was cancelled.',
        );

      case DioExceptionType.badResponse:
        return _fromStatusCode(
          statusCode: e.response?.statusCode,
          data:       e.response?.data,        // raw JSON — no model
        );

      default:
        return UnknownException(
          message: e.message ?? 'Something went wrong.',
        );
    }
  }

  static AppException _fromStatusCode({
    required int?    statusCode,
    required dynamic data,
  }) {
    // Extract message directly from raw JSON
    final message = _extractMessage(data, statusCode);

    return switch (statusCode) {
      400 => BadRequestException(message: message),
      401 => UnauthorizedException(message: message),
      403 => ForbiddenException(message: message),
      404 => NotFoundException(message: message),
      409 => ConflictException(message: message),
      422 => ValidationException(
        message: message,
        // raw errors map directly — no model
        errors: data is Map<String, dynamic>
            ? data['errors'] as Map<String, dynamic>?
            : null,
      ),
      429 => TooManyRequestsException(message: message),
      500 => ServerException(message: message),
      _   => UnknownException(message: message),
    };
  }

  // Extract message from raw JSON — no model
  static String _extractMessage(dynamic data, int? statusCode) {
    try {
      if (data is Map<String, dynamic>) {

        // { "message": "..." }
        if (data['message'] is String) {
          return data['message'] as String;
        }

        // { "error": "..." }
        if (data['error'] is String) {
          return data['error'] as String;
        }

        // { "errors": { "email": ["already taken"] } }
        if (data['errors'] is Map) {
          final errors = data['errors'] as Map<String, dynamic>;
          final first  = errors.values.first;
          if (first is List && first.isNotEmpty) {
            return first.first.toString();
          }
          return first.toString();
        }

        // { "errors": ["error1", "error2"] }
        if (data['errors'] is List) {
          final errors = data['errors'] as List;
          if (errors.isNotEmpty) return errors.first.toString();
        }
      }
    } catch (_) {}

    return _defaultMessage(statusCode);
  }

  static String _defaultMessage(int? statusCode) {
    return switch (statusCode) {
      400 => 'Bad request. Please check your input.',
      401 => 'Invalid credentials. Please log in again.',
      403 => 'You do not have permission to do this.',
      404 => 'The requested resource was not found.',
      409 => 'This already exists.',
      422 => 'Invalid data. Please check your input.',
      429 => 'Too many requests. Please slow down.',
      500 => 'Server error. Please try again later.',
      _   => 'Something went wrong. Please try again.',
    };
  }
}