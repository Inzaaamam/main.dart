import 'package:auth_app/app/modules/auth/signup/signup_state.dart';
import 'package:auth_app/app/sdk/services/api/entities/signup.dart';
import 'package:bloc/bloc.dart';

import '../../../sdk/models/user.dart';
import '../../../sdk/utils/utils.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState());
  Future<void> signUpform(Map<String, dynamic> data) async {
    emit(
      state.copyWith(isLoading: true, status: Status.intial),
    );
    try {
      final response = await SignUpApi().signUp(data);
      UserModel.fromJson(response['data']);
      emit(
        state.copyWith(isLoading: true, status: Status.success),
      );
    } catch (e) {
      emit(
        state.copyWith(isLoading: true, status: Status.fail),
      );
      Exception(e);
    }
  }
}
