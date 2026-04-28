import 'package:bloging_app/fetures/login/data/models/sign_in_model.dart';

abstract class LoginRepository {
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });
}