import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_endpoints.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class ApiClient {
  ApiClient._();

  static Dio create(SharedPreferences prefs) {
    final dio = Dio(
      BaseOptions(
        baseUrl:        ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout:    const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept':       'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(prefs),
      ErrorInterceptor(),
    ]);

    return dio;
  }
}