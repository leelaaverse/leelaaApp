import '../../../network/loading_handler.dart';
import '../../../utils/helper.dart';
import '../../screen/login_screen.dart';
import '../state/reset_password_state.dart';

abstract class ResetPasswordEvent {}

class DataChange extends ResetPasswordEvent {
  final String? password;
  final String? confirmPassword;

  DataChange({this.confirmPassword, this.password});
}

class PasswordEyeChange extends ResetPasswordEvent {
  final bool passwordEye;
  final bool confirmPasswordEye;

  PasswordEyeChange({
    this.passwordEye = false,
    this.confirmPasswordEye = false,
  });
}

class GetInitialData extends ResetPasswordEvent {
  final String number;

  GetInitialData({this.number = ""});
}

class SubmitPassword extends ResetPasswordEvent {}

class BackCall extends ResetPasswordEvent {}

class EventCallHandler with Helper {
  ResetPasswordState state;

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
      callNextScreen(LoginScreen());
      callSnackBar("Password reset successfully", title: "Success");
    }
  }
}
