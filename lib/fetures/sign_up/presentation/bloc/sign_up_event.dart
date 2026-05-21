import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateUserEvent extends SignUpEvent {
  final String fullName;
  final String mobileNo;
  final String emailId;
  final String password;

  CreateUserEvent({required this.mobileNo, required this.fullName, required this.emailId, required this.password});

  @override
  List<Object?> get props => [fullName,mobileNo,emailId,password];
}
