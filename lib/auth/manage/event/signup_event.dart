import '../../../network/loading_handler.dart';
import '../../../utils/helper.dart';
import '../../screen/otp_screen.dart';
import '../state/signup_state.dart';

abstract class SignupEvent {}

class DataChange extends SignupEvent {
  final String? email;
  final String? number;
  final String? countryCode;
  final String? password;
  final String? confirmPassword;
  final String? name;
  final String? userName;
  final String? image;

  DataChange({
    this.userName,
    this.name,
    this.email,
    this.number,
    this.countryCode,
    this.confirmPassword,
    this.password,
    this.image,
  });
}

class PasswordEyeChange extends SignupEvent {
  final bool passwordEye;
  final bool confirmPasswordEye;

  PasswordEyeChange({
    this.passwordEye = false,
    this.confirmPasswordEye = false,
  });
}

class SignUpSubmit extends SignupEvent {}

class LoginCall extends SignupEvent {}

class EventCallHandler with Helper {
  SignupState state;

  EventCallHandler(this.state);

  click() {
    if (state.isSubmitting) {
      LoadingHandler().showLoading();
    }

    if (state.errorMessage.isNotEmpty) {
      LoadingHandler().hideLoading();
      showErrorPopUp(state.errorMessage);
    }
    if (state.isSuccess) {
      LoadingHandler().hideLoading();
      callNextScreen(OtpScreen(state.number, isLogin: true));
    }
  }
}
