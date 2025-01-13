
import 'package:auth_app/app/sdk/extension/extension.dart';
import 'package:auth_app/app/style/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../routes/constant.dart';
import '../../style/layout/size.dart';
import '../auth/login/user/user_cubit.dart';
import 'home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Text(
                'Home Screen',
                style: TextStyle(fontSize: Sizes.s20),
              ),
              GestureDetector(
                onTap: () async {
                  GetIt.I.get<UserCubit>().removeUser();
                  Navigator.of(context).pushNamed(Routes.login);
                },
                child: const Icon(
                  Icons.logout_rounded,
                  size: 24,
                  color: CustomColor.white,
                ),
              )
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        color: CustomColor.primary,
                        child: const Center(
                          child: Text(
                            'Home',
                            style: TextStyle(fontSize: 20, color: CustomColor.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: CustomColor.primary,
                        child: const Center(
                          child: Text(
                            'Splash',
                            style: TextStyle(fontSize: 20, color: CustomColor.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ).addAllPad(16)),
      ),
    );
  }
}
