import 'package:bloging_app/core/network/api_clients.dart';
import 'package:bloging_app/core/network/api_endpoints.dart';
import 'package:bloging_app/fetures/login/data/remote/login_service.dart';
import 'package:bloging_app/fetures/login/data/remote/repository_impl.dart';
import 'package:bloging_app/fetures/login/domain/login_repository.dart';
import 'package:bloging_app/fetures/login/presentation/bloc/login_bloc.dart';
import 'package:bloging_app/fetures/sign_up/data/remote/sign_up_repo_impl.dart';
import 'package:bloging_app/fetures/sign_up/data/remote/sign_up_service.dart';
import 'package:bloging_app/fetures/sign_up/domain/sign_up_repo.dart';
import 'package:bloging_app/fetures/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 🔹 External
  sl.registerLazySingleton(() => Dio());

  // 🔹 Service
  sl.registerLazySingleton<LoginService>(
    () => LoginService(sl<Dio>(), baseUrl: ApiEndpoints.baseUrl),
  );

  // 🔹 Repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(authService: sl()),
  );

  // 🔹 Bloc
  sl.registerFactory(() => LoginBloc(sl<LoginRepository>()));

  sl.registerLazySingleton<SignUpService>(
    () => SignUpService(sl<Dio>(),baseUrl: ApiEndpoints.baseUrl),
  );

  sl.registerLazySingleton<SignUpRepo>(
      () => SignUpRepoImpl(signUpService: sl()),
  );

  sl.registerFactory(() => SignUpBloc(sl<SignUpRepo>()),);
}
