import 'package:auth_app/app/sdk/utils/utils.dart';
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  const SignupState({this.status = Status.intial, this.isLoading = false});
  final Status? status;
  final bool? isLoading;
  SignupState copyWith({Status? status, bool? isLoading}) {
    return SignupState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [status, isLoading];
}
