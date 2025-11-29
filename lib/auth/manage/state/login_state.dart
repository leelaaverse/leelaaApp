class LoginState {
  final String email;
  final String password;
  final String? number;
  final bool isSubmitting;
  final bool isEyeOpen;
  final bool isSuccess;
  final String errorMessage;

  LoginState({
    required this.email,
    this.number,
    required this.password,
    this.isSubmitting = false,
    this.isEyeOpen = false,
    this.isSuccess = false,
    this.errorMessage = "",
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? number,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isEyeOpen,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      number: number ?? this.number,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isEyeOpen: isEyeOpen ?? this.isEyeOpen,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? "",
    );
  }

  factory LoginState.initial() {
    return LoginState(email: '', password: '');
  }
}
