import 'package:bloging_app/core/constants/strings.dart';
import 'package:bloging_app/core/utils/extension.dart';
import 'package:bloging_app/fetures/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:bloging_app/fetures/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:bloging_app/fetures/sign_up/presentation/bloc/sign_up_state.dart';
import 'package:bloging_app/fetures/widgets/common_btn.dart';
import 'package:bloging_app/fetures/widgets/common_text_form_field.dart';
import 'package:bloging_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController fullNameController;
  late TextEditingController mobileController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
    mobileController = TextEditingController();
    fullNameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is UserCreateSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(AppStrings.strSignUpSuccess)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.wp(50)),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  50.hp,

                  CommonTextField(
                    hintText: AppStrings.strEnterName,
                    controller: fullNameController,
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      if (value!.isEmpty) return AppStrings.strReqName;
                      return null;
                    },
                  ),

                  CommonTextField(
                    hintText: AppStrings.strEnterMob,
                    controller: mobileController,
                    prefixIcon: const Icon(Icons.contact_mail_rounded),
                    validator: (value) {
                      if (value!.isEmpty) return AppStrings.strReqMob;
                      return null;
                    },
                  ),

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
                      if (formKey.currentState!.validate()) {
                        context.read<SignUpBloc>().add(
                          CreateUserEvent(
                            emailId: emailController.text.trim().toString(),
                            fullName: fullNameController.text.trim().toString(),
                            password: passController.text.trim().toString(),
                            mobileNo: mobileController.text.trim().toString(),
                          ),
                        );
                      }
                    },
                    text: AppStrings.strLogin,
                    isLoading: state is UserCreateLoadingState,
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
