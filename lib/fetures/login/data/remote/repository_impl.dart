import 'package:bloging_app/core/network/dio_error_handler.dart';
import 'package:bloging_app/fetures/login/data/models/sign_in_model.dart';
import 'package:bloging_app/fetures/login/data/remote/login_service.dart';
import 'package:bloging_app/fetures/login/domain/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService authService;

  LoginRepositoryImpl({required this.authService});

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authService.login({
        'email': email,
        'password': password,
      });

      return response;
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
