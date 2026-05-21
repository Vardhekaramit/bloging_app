
import 'package:bloging_app/core/network/api_endpoints.dart';
import 'package:bloging_app/fetures/sign_up/data/models/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'sign_up_service.g.dart';

@RestApi()
abstract class SignUpService {
  factory SignUpService(Dio dio, {String baseUrl}) = _SignUpService;

  @POST(ApiEndpoints.signUp)
  Future<SignUpModel> signUp(@Body() Map<String, dynamic> body);
}