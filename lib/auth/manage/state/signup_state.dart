class SignupState {
  final String name;
  final String userName;
  final String countryCode;
  final String image;
  final String number;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isSubmitting;
  final bool isPasswordEyeOpen;
  final bool isConfirmPasswordEyeOpen;
  final bool isSuccess;
  final String errorMessage;

  SignupState({
    required this.name,
    required this.userName,
    this.countryCode = "+91",
    required this.number,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.isSubmitting = false,
    this.isPasswordEyeOpen = false,
    this.isConfirmPasswordEyeOpen = false,
    this.isSuccess = false,
    this.errorMessage = "",
    this.image = "",
  });

  SignupState copyWith({
    String? name,
    String? userName,
    String? countryCode,
    String? number,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isPasswordEyeOpen,
    bool? isConfirmPasswordEyeOpen,
    String? errorMessage,
    String? image,
  }) {
    return SignupState(
      name: name ?? this.name,
      userName: userName ?? this.userName,
      countryCode: countryCode ?? this.countryCode,
      number: number ?? this.number,
      email: email ?? this.email,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isPasswordEyeOpen: isPasswordEyeOpen ?? this.isPasswordEyeOpen,
      isConfirmPasswordEyeOpen:
      isConfirmPasswordEyeOpen ?? this.isConfirmPasswordEyeOpen,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? "",
      image: image ?? this.image,
    );
  }

  factory SignupState.initial() {
    return SignupState(
      userName: '',
      name: '',
      number: '',
      email: '',
      password: '',
      confirmPassword: '',
    );
  }
}
