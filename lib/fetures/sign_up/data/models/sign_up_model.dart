class SignUpModel {
  final String? message;

  SignUpModel({required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(message: json['message']?.toString());
  }
}
