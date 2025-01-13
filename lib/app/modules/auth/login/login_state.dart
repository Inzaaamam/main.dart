import '../../../sdk/utils/utils.dart';

class LoginState {
  LoginState({this.status = Status.intial, this.isLoading = false, this.token});
  final Status? status;
  final bool? isLoading;
  final String? token;
  LoginState copyWith({bool? isLoading, Status? status, String? token}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}
