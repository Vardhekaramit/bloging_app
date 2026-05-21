import 'package:bloging_app/core/constants/app_colors.dart';
import 'package:bloging_app/core/constants/assets.dart';
import 'package:bloging_app/core/constants/strings.dart';
import 'package:bloging_app/core/utils/extension.dart';
import 'package:bloging_app/di/injection.dart';
import 'package:bloging_app/fetures/login/presentation/bloc/login_bloc.dart';
import 'package:bloging_app/fetures/login/presentation/bloc/login_event.dart';
import 'package:bloging_app/fetures/login/presentation/bloc/login_state.dart';
import 'package:bloging_app/fetures/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:bloging_app/fetures/sign_up/presentation/sign_up_page.dart';
import 'package:bloging_app/fetures/widgets/common_btn.dart';
import 'package:bloging_app/fetures/widgets/common_text_form_field.dart';
import 'package:bloging_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            // 🔹 Top Gradient (your existing UI reused)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                ),
              ),
              height: context.hp(300),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: context.hp(40),
                    width: context.wp(60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.background(context),
                    ),
                    child: Center(child: Image.asset(Assets.openBook)),
                  ),
                  SizedBox(height: context.hp(10)),
                  Text(AppStrings.dailyRead),
                  Text(AppStrings.voiceYour),
                ],
              ),
            ),
            10.hp,
            const TabBar(
              tabs: [
                Tab(text: "Login"),
                Tab(text: "Sign Up"),
              ],
            ),

            // 🔹 Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  LoginView(),
                  BlocProvider(
                    create: (context) => sl<SignUpBloc>(),
                    child: SignUpPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;

  late TextEditingController passController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(AppStrings.strLoginSuccess)));
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.wp(50)),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  50.hp,

                  // EMAIL
                  CommonTextField(
                    hintText: AppStrings.enterEmail,
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if (value!.isEmpty) return AppStrings.strReqMail;
                      return null;
                    },
                  ),

                  10.hp,

                  // PASSWORD
                  CommonTextField(
                    hintText: AppStrings.password,
                    controller: passController,
                    prefixIcon: const Icon(Icons.password),
                    validator: (value) {
                      if (value!.isEmpty) return AppStrings.strReqPass;
                      return null;
                    },
                  ),

                  25.hp,

                  CommonButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(
                          SignUpEvent(
                            email: emailController.text,
                            password: passController.text,
                          ),
                        );
                      }
                    },
                    text: AppStrings.strLogin,
                    isLoading: state is LoginLoadingState,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
