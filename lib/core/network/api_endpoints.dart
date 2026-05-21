///1. app calls _apiService.login({'email':..., 'password':...})
//       │
//       ▼
// 2. LoggerInterceptor.onRequest()
//    → prints: POST /auth/login
//       │
//       ▼
// 3. AuthInterceptor.onRequest()
//    → adds: Authorization: Bearer <token>
//       │
//       ▼
// 4. RetryInterceptor — passes through
//       │
//       ▼
// 5. ErrorInterceptor — passes through
//       │
//       ▼
// 6. API receives request
//       │
//    ┌──┴──────────────────┐
//    │ success             │ error (401)
//    ▼                     ▼
// 7. ErrorInterceptor   ErrorInterceptor.onError()
//    .onResponse()      → DioErrorHandler.handle()
//    → passes through   → throws UnauthorizedException
//       │                     │
//       ▼                     ▼
// 8. RetryInterceptor   RetryInterceptor.onError()
//    → passes through   → retries if needed
//       │                     │
//       ▼                     ▼
// 9. AuthInterceptor    AuthInterceptor.onError()
//    → passes through   → clears token if 401
//       │                     │
//       ▼                     ▼
// 10. LoggerInterceptor LoggerInterceptor.onError()
//     → logs response   → logs error
//       │                     │
//       ▼                     ▼
// 11. Repository        Repository catch block
//     gets raw JSON     gets UnauthorizedException

class ApiEndpoints {
  ApiEndpoints._();

  static const baseUrl = 'http://192.168.1.9:8000/';

  // Auth
  static const signUp  = 'user/signup';
  static const login  = 'user/signin';
}