class OtpState {
  final String number;
  final bool isLogin;
  final String otp;
  final String displayTime;
  final bool resendEnable;
  final bool isSubmitting;
  final bool isSuccess;
  final String errorMessage;

  OtpState({
    required this.number,
    required this.otp,
    this.isLogin = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.resendEnable = false,
    this.errorMessage = "",
    this.displayTime = "",
  });

  OtpState copyWith({
    String? number,
    String? otp,
    bool? isLogin,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isPasswordEyeOpen,
    bool? resendEnable,
    bool? isConfirmPasswordEyeOpen,
    String? errorMessage,
    String? displayTime,
  }) {
    return OtpState(
      number: number ?? this.number,
      otp: otp ?? this.otp,
      isLogin: isLogin ?? this.isLogin,
      resendEnable: resendEnable ?? this.resendEnable,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? "",
      displayTime: displayTime ?? this.displayTime,
    );
  }

  factory OtpState.initial() {
    return OtpState(number: '', otp: '');
  }
}
