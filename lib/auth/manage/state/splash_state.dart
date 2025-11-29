class SplashState {
  final bool changeScreen;

  SplashState({this.changeScreen = false});

  SplashState copyWith({bool? changeScreen}) {
    return SplashState(changeScreen: changeScreen ?? this.changeScreen);
  }

  factory SplashState.initial() {
    return SplashState();
  }
}
