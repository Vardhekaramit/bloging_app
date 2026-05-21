import 'package:bloging_app/core/network/dio_error_handler.dart';
import 'package:bloging_app/fetures/sign_up/data/models/sign_up_model.dart';
import 'package:bloging_app/fetures/sign_up/data/remote/sign_up_service.dart';
import 'package:bloging_app/fetures/sign_up/domain/sign_up_repo.dart';
import 'package:dio/dio.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpService signUpService;

  SignUpRepoImpl({required this.signUpService});

  @override
  Future<SignUpModel> signUp({
    required String fullName,
    required String mobileNo,
    required String emailId,
    required String password,
  }) async {
    try {
      final response = signUpService.signUp({
        'name': fullName,
        'email': emailId,
        'password': password,
        'mobile': mobileNo,
      });

      return response;
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
