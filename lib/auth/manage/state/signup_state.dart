class SignupState {
  final String firstName;
  final String lastName;
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
    required this.firstName,
    required this.lastName,
    required this.userName,
    this.countryCode = "+91",
    this.number = "",
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
    String? firstName,
    String? lastName,
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
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
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
      firstName: '',
      lastName: '',
      number: '',
      email: '',
      password: '',
      confirmPassword: '',
    );
  }
}
