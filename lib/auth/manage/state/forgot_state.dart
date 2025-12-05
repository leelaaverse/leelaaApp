class ForgotState {
  final String email;
  final bool isSubmitting;
  final bool isSuccess;
  final String errorMessage;
  final String successMessage;

  ForgotState({
    required this.email,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage = "",
    this.successMessage = "",
  });

  ForgotState copyWith({
    String? email,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
    String? successMessage,
  }) {
    return ForgotState(
      email: email ?? this.email,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? "",
      successMessage: successMessage ?? this.successMessage,
    );
  }

  factory ForgotState.initial() {
    return ForgotState(email: '');
  }
}
