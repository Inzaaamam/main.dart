import 'package:auth_app/app/modules/auth/login/user/user_state.dart';
import 'package:auth_app/app/sdk/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState()) {
    init();
  }

  late SharedPreferences sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  updateUser(UserModel user) {
    emit(state.copyWith(user: user));
  }

  removeUser() {
    sharedPreferences.remove('user');
    emit(state.copyWith(user: null));
  }
}
