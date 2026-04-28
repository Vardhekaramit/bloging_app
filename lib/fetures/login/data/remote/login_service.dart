import 'package:bloging_app/core/network/api_endpoints.dart';
import 'package:bloging_app/fetures/login/data/models/sign_in_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST(ApiEndpoints.login)
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);
}
