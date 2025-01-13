import 'package:auth_app/app/sdk/models/user.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState({this.user});
  final UserModel? user;
  UserState copyWith({UserModel? user}) {
    return UserState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [];
}
