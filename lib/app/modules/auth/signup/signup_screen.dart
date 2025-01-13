import 'package:auth_app/app/modules/auth/signup/signup.dart';
import 'package:auth_app/app/sdk/extension/extension.dart';
import 'package:auth_app/app/sdk/widget/custom_fill_button.dart';
import 'package:auth_app/app/sdk/widget/custom_reactive_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../routes/constant.dart';
import '../../../sdk/forms/signup.dart';
import '../../../sdk/utils/utils.dart';
import '../../../style/color/color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = SignUpForm.signup;

    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('SignUp Screen')),
        ),
        body: BlocListener<SignupCubit, SignupState>(
          listener: (context, SignupState state) {
            if (state.status == Status.success) {
              Navigator.of(context).pushNamed(Routes.login);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Signup Successfully')),
              );
            } else if (state.status == Status.fail) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error during signup')),
              );
            }
          },
          child: SingleChildScrollView(
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomReactiveFied(
                    labal: 'First Name',
                    hintText: 'First Name',
                    formController: 'first_name',
                    validationMessage: 'First Name is required',
                  ),
                  const SizedBox(height: 15),
                  const CustomReactiveFied(
                    labal: 'Last Name',
                    hintText: 'Last Name',
                    formController: 'last_name',
                    validationMessage: 'Last Name is required',
                  ),
                  const SizedBox(height: 15),
                  const CustomReactiveFied(
                    labal: 'Enter Email',
                    hintText: 'Enter Email',
                    formController: 'email',
                    validationMessage: 'Email is required',
                  ),
                  const SizedBox(height: 15),
                  const CustomReactiveFied(
                    labal: 'Phone Number',
                    hintText: 'Phone Number',
                    formController: 'phone_number',
                    validationMessage: 'Phone Number is required',
                  ),
                  const SizedBox(height: 15),
                  const CustomReactiveFied(
                    labal: 'Enter Password',
                    hintText: 'Enter Password',
                    formController: 'password',
                    validationMessage: 'Password is required',
                  ),
                  const SizedBox(height: 15),
                  const CustomReactiveFied(
                    labal: 'Enter Confirm Password',
                    hintText: 'Enter Confirm Password',
                    formController: 'confirm_password',
                    validationMessage: 'Passwords must match',
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<SignupCubit, SignupState>(
                          builder: (context, state) {
                            return CustomFillButton(
                              isloading: state.isLoading!,
                              label: 'SignUp',
                              onTap: () {
                                if (form.valid) {
                                  final data = {
                                    "first_name":
                                        form.control('first_name').value as String,
                                    "last_name":
                                        form.control('last_name').value as String,
                                    "email": form.control('email').value as String,
                                    "phone_number":
                                        form.control('phone_number').value as String,
                                    "password": form.control('password').value as String,
                                  };
                                  context.read<SignupCubit>().signUpform(data);
                                } else {
                                  form.markAllAsTouched();
                                }
                              },
                            );
                          },
                        ),
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
                          text: "If You have already account please",
                          style: const TextStyle(color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(
                              text: ' Login',
                              style: const TextStyle(
                                  color: CustomColor.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed(Routes.login);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ).addAllPad(16),
          ),
        ),
      ),
    );
  }
}
