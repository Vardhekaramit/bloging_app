import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends LoginEvent {
  final String email;
  final String password;

  SignUpEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
