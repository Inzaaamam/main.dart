import 'dart:convert';

import 'package:auth_app/app/modules/auth/login/user/user_cubit.dart';
import 'package:auth_app/app/sdk/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../sdk/services/api/entities/login.dart';
import '../../../sdk/utils/utils.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState()) {
    inIt();
  }

  late SharedPreferences share;
  late UserCubit userCubit;
  Future<void> inIt() async {
    userCubit = UserCubit();
    share = await SharedPreferences.getInstance();
  }

  Future<Map<String, dynamic>?> login(Map<String, dynamic> data) async {
    emit(state.copyWith(isLoading: true, status: Status.intial));
    try {
      final response = await SignInApi().signIn(data);
      final user = UserModel.fromJson(response);
      share.setString('user', jsonEncode(response));
      userCubit.updateUser(user);
      emit(state.copyWith(
        isLoading: false,
        status: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        status: Status.fail,
      ));
      Exception(e.toString());
    }
    return null;
  }

}
