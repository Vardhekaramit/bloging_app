import 'package:bloging_app/di/injection.dart';
import 'package:bloging_app/fetures/login/presentation/bloc/login_bloc.dart';
import 'package:bloging_app/fetures/login/presentation/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  BlocProvider(
          create: (_) => sl<LoginBloc>(),
          child: LoginPage()),
    ),
  ],
);