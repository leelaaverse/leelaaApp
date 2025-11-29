class ResetPasswordState {
  final String number;
  final String password;
  final String confirmPassword;
  final bool isSubmitting;
  final bool isPasswordEyeOpen;
  final bool isConfirmPasswordEyeOpen;
  final bool isSuccess;
  final String errorMessage;

  ResetPasswordState({
    required this.number,
    required this.password,
    required this.confirmPassword,
    this.isSubmitting = false,
    this.isPasswordEyeOpen = false,
    this.isConfirmPasswordEyeOpen = false,
    this.isSuccess = false,
    this.errorMessage = "",
  });

  ResetPasswordState copyWith({
    String? number,
    String? password,
    String? confirmPassword,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isPasswordEyeOpen,
    bool? isConfirmPasswordEyeOpen,
    String? errorMessage,
  }) {
    return ResetPasswordState(
      number: number ?? this.number,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isPasswordEyeOpen: isPasswordEyeOpen ?? this.isPasswordEyeOpen,
      isConfirmPasswordEyeOpen:
      isConfirmPasswordEyeOpen ?? this.isConfirmPasswordEyeOpen,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? "",
    );
  }

  factory ResetPasswordState.initial() {
    return ResetPasswordState(number: '', password: '', confirmPassword: '');
  }
}
