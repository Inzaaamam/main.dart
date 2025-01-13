import 'package:auth_app/app/modules/splash/splash_cubit.dart';
import 'package:auth_app/app/modules/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/constant.dart';
import '../../sdk/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state.splash == Splash.home) {
              Navigator.of(context).pushNamed(Routes.home);
            } else if (state.splash == Splash.login) {
              Navigator.of(context).pushNamed(Routes.login);
            }
          },
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Center(child: Text('Splash Screen')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
