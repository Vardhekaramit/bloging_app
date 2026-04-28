import 'package:bloging_app/fetures/login/data/remote/repository_impl.dart';
import 'package:bloging_app/fetures/login/domain/login_repository.dart';
import 'package:bloging_app/fetures/login/presentation/bloc/login_event.dart';
import 'package:bloging_app/fetures/login/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginInitialState()) {
    on<SignUpEvent>(_onLogin);
  }

  Future<void> _onLogin(
      SignUpEvent loginEvent,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoadingState());

    try {
      final response = await _loginRepository.login(
        email: loginEvent.email,
        password: loginEvent.password,
      );
      emit(LoginSuccessState(response.user.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
