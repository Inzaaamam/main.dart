import '../../sdk/utils/utils.dart';

class SplashState {
  SplashState({this.splash});
  final Splash? splash;
  SplashState copyWith({Splash? splash}) {
    return SplashState(splash: splash ?? this.splash);
  }
}
