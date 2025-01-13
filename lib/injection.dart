import 'package:get_it/get_it.dart';
import 'app/modules/auth/login/user/user_cubit.dart';

class Injection {
  static Future<void> initDI() async {
    ///User Cubit
    GetIt.I.registerSingleton<UserCubit>(
      UserCubit(),
    );
  }
}
