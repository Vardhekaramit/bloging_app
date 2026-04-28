import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final SharedPreferences _prefs;
  static const _tokenKey = 'auth_token';

  AuthInterceptor(this._prefs);

  // ── Before every request ──────────────────────────────────
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    final token = _prefs.getString(_tokenKey);

    if (token != null) {
      // Attach token to every request automatically
      // Without this you'd have to add it manually every time
      options.headers['Authorization'] = 'Bearer $token';
    }

    print('→ REQUEST: ${options.method} ${options.path}');
    print('→ HEADERS: ${options.headers}');
    print('→ BODY:    ${options.data}');

    handler.next(options); // continue sending request
  }

  // ── After every response ──────────────────────────────────
  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    print('← RESPONSE: ${response.statusCode}');
    print('← DATA:     ${response.data}');

    handler.next(response); // pass response to repository
  }

  // ── On error ──────────────────────────────────────────────
  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    if (err.response?.statusCode == 401) {
      // Token expired — clear it and redirect to login
      print('Token expired — clearing session');
      _prefs.remove(_tokenKey);

      // You can navigate to login here
      // NavigationService.navigateTo('/login');
    }

    handler.next(err); // pass error to ErrorInterceptor
  }
}