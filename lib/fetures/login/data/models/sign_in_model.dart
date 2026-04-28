class LoginResponseModel {
  final String? user;
  final String? token;

  LoginResponseModel({
    required this.user,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: json['message']?.toString(),
      token: json['token']?.toString(),
    );
  }
}