import 'package:bloging_app/fetures/sign_up/data/models/sign_up_model.dart';

abstract class SignUpRepo {
  Future<SignUpModel> signUp({
    required String fullName,
    required String mobileNo,
    required String emailId,
    required String password,
});
}