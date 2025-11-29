import 'package:leelaah/dashboard/screen/dashboard.dart';

import '../../../network/loading_handler.dart';
import '../../../utils/helper.dart';
import '../../screen/otp_screen.dart';
import '../state/login_state.dart';

abstract class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
}

class PasswordEyeChange extends LoginEvent {
  final bool show;

  PasswordEyeChange(this.show);
}

class LoginSubmitted extends LoginEvent {}

class GoogleSubmitted extends LoginEvent {}

class AppleSubmitted extends LoginEvent {}

class SignupCall extends LoginEvent {}

class ForgotCall extends LoginEvent {}

class EventCallHandler with Helper {
  LoginState state;

  EventCallHandler(this.state);

  submitClick() {
    if (state.isSubmitting) {
      LoadingHandler().showLoading();
    }

    if (state.errorMessage!.isNotEmpty) {
      if (state.errorMessage == "otp") {
        LoadingHandler().hideLoading();
        callNextAndClearStack(OtpScreen(state.number ?? state.email));
      } else {
        LoadingHandler().hideLoading();
        showErrorPopUp(state.errorMessage);
      }
    }
    if (state.isSuccess) {
      LoadingHandler().hideLoading();
      callNextAndClearStack(Dashboard());
    }
  }
}
