import 'package:auth_app/app/modules/auth/login/user/user_cubit.dart';
import 'package:auth_app/app/modules/splash/splash_state.dart';
import 'package:auth_app/app/sdk/db/user/user.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../sdk/utils/utils.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState()) {
    init();
  }
  late UserCubit userCubit;
  Future<void> init() async {
    userCubit = GetIt.I.get<UserCubit>();
    await userExist();
  }

  Future<void> userExist() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      final data = await DaoUser.get.getUser();
      if (data != null && data.isNotEmpty) {
        emit(state.copyWith(splash: Splash.home));
      } else {
        emit(state.copyWith(splash: Splash.login));
      }
    } catch (e) {
      rethrow;
    }
  }

  // using shared preference implement login system
  // late SharedPreferences shared;
  // late UserCubit userCubit;
  // Future<void> init() async {
  //   shared = await SharedPreferences.getInstance();
  //   userCubit = GetIt.I.get<UserCubit>();
  //   await checkAvalibalityOfUser();
  // }
  //
  // Future<void> checkAvalibalityOfUser() async {
  //   await Future<void>.delayed(const Duration(seconds: 2));
  //   final data = shared.getString('user');
  //   if (data != null) {
  //     final user = UserModel.fromJson(jsonDecode(data));
  //     userCubit.addUser(user);
  //     emit(state.copyWith(splash: Splash.home));
  //   } else {
  //     emit(state.copyWith(splash: Splash.login));
  //   }
  // }
  //
  // remove() async {
  //   return userCubit.removeUser();
  // }
}
