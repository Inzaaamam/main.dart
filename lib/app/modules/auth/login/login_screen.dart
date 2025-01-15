import 'package:auth_app/app/modules/auth/login/login.dart';
import 'package:auth_app/app/sdk/extension/extension.dart';
import 'package:auth_app/app/sdk/forms/login.dart';
import 'package:auth_app/app/sdk/utils/utils.dart';
import 'package:auth_app/app/sdk/widget/custom_fill_button.dart';
import 'package:auth_app/app/style/color/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../routes/constant.dart';
import '../../../sdk/widget/custom_reactive_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = LoginForm.login;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Login Screen')),
        ),
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == Status.success) {
              Navigator.of(context).pushNamed(Routes.home);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login Successfully')),
              );
            } else if (state.status == Status.fail) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error during signup')),
              );
            }
          },
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomReactiveFied(
                  labal: 'Enter Email',
                  formController: 'email',
                  validationMessage: 'Email is Required',
                  hintText: 'Enter Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomReactiveFied(
                  labal: 'Enter Password',
                  formController: 'password',
                  validationMessage: 'Password is Required',
                  hintText: 'Enter Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child:
                          BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
                        return CustomFillButton(
                          isloading: state.isLoading!,
                          label: 'Login',
                          onTap: () {
                            if (form.valid) {
                              Map<String, dynamic> data = {
                                'email': form.control('email').value as String,
                                'password': form.control('password').value as String
                              };
                              context.read<LoginCubit>().userLogin(data);
                            } else {
                              form.markAllAsTouched();
                            }
                          },
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                            text: ' Sign up',
                            style: const TextStyle(
                                color: CustomColor.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(Routes.signup);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ).addAllPad(16),
      ),
    );
  }
}
