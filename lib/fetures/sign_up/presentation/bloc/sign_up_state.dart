import 'package:bloging_app/fetures/sign_up/data/models/sign_up_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserCreateInitialState extends SignUpState {}

class UserCreateLoadingState extends SignUpState {}

class UserCreateSuccessState extends SignUpState {
  final SignUpModel? response;
  UserCreateSuccessState({this.response});

  @override
  List<Object?> get props => [response];
}

class UserCreateFailureState extends SignUpState {
  final String? msg;
  UserCreateFailureState({this.msg});

  @override
  List<Object?> get props => [msg];
}
