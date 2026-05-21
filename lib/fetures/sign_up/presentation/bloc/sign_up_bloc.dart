import 'package:bloging_app/fetures/sign_up/data/models/sign_up_model.dart';
import 'package:bloging_app/fetures/sign_up/domain/sign_up_repo.dart';
import 'package:bloging_app/fetures/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:bloging_app/fetures/sign_up/presentation/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepo signUpRepo;

  SignUpBloc(this.signUpRepo) : super(UserCreateInitialState()) {
    on<CreateUserEvent>(_createUser);
  }

  Future<void> _createUser(
    CreateUserEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(UserCreateLoadingState());

    try {
      SignUpModel response = await signUpRepo.signUp(
        fullName: event.fullName,
        mobileNo: event.mobileNo,
        emailId: event.emailId,
        password: event.password,
      );
      emit(UserCreateSuccessState(response: response));
    } catch (e) {
      emit(UserCreateFailureState(msg: e.toString()));
    }
  }
}
