import 'package:auth_app/app/modules/auth/login/user/user_state.dart';
import 'package:auth_app/app/sdk/models/user.dart';
import 'package:bloc/bloc.dart';
import '../../../../sdk/db/user/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());
  // {
  //   init();
  // }
  addUser(UserModel user) {
    emit(state.copyWith(user: user));
  }

  deleteUser() {
    return DaoUser.get.deteteTable();
  }

  // late SharedPreferences sharedPreferences;
  // Future<void> init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }
  //
  // updateUser(UserModel user) {
  //   emit(state.copyWith(user: user));
  // }
  //
  // removeUser() {
  //   sharedPreferences.remove('user');
  //   emit(state.copyWith(user: null));
  // }
}
