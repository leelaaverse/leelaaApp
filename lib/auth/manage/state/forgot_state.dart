class ForgotState {
  final String number;
  final bool isSubmitting;
  final bool isSuccess;
  final String errorMessage;

  ForgotState({
    required this.number,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage = "",
  });

  ForgotState copyWith({
    String? number,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ForgotState(
      number: number ?? this.number,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? "",
    );
  }

  factory ForgotState.initial() {
    return ForgotState(number: '');
  }
}
