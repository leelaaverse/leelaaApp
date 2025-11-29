class ChangePasswordState {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  final bool isOldEyeOpen;
  final bool isNewEyeOpen;
  final bool isConfirmEyeOpen;

  final bool isLoading;
  final String errorMessage;

  ChangePasswordState({
    this.oldPassword = "",
    this.newPassword = "",
    this.confirmPassword = "",
    this.isOldEyeOpen = false,
    this.isNewEyeOpen = false,
    this.isConfirmEyeOpen = false,
    this.isLoading = false,
    this.errorMessage = "",
  });

  ChangePasswordState copyWith({
    String? oldPassword,
    String? newPassword,
    String? confirmPassword,
    bool? isOldEyeOpen,
    bool? isNewEyeOpen,
    bool? isConfirmEyeOpen,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isOldEyeOpen: isOldEyeOpen ?? this.isOldEyeOpen,
      isNewEyeOpen: isNewEyeOpen ?? this.isNewEyeOpen,
      isConfirmEyeOpen: isConfirmEyeOpen ?? this.isConfirmEyeOpen,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? "",
    );
  }

  factory ChangePasswordState.initial() {
    return ChangePasswordState();
  }
}
