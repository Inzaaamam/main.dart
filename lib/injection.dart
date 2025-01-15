import 'package:auth_app/app/sdk/db/app_database.dart';
import 'package:get_it/get_it.dart';
import 'app/modules/auth/login/user/user_cubit.dart';

class Injection {
  static Future<void> initDI() async {
    GetIt.I.registerSingleton<AppDatabase>(AppDatabase.get);
    ///User Cubit
    GetIt.I.registerSingleton<UserCubit>(
      UserCubit(),
    );
  }
}
