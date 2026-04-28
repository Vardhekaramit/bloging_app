import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String message;

  const LoginSuccessState(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);
}
