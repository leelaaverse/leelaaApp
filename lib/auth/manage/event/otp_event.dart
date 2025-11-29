import '../../../network/loading_handler.dart';
import '../../../utils/helper.dart';
import '../../screen/reset_password_screen.dart';
import '../state/otp_state.dart';

abstract class OtpEvent {}

class DataChange extends OtpEvent {
  final String otp;

  DataChange({this.otp = ""});
}

class SubmitCall extends OtpEvent {}

class ResendOtp extends OtpEvent {}

class TimeChange extends OtpEvent {
  String time;
  bool isEnable;

  TimeChange(this.time, this.isEnable);
}

class GetInitialData extends OtpEvent {
  final String number;
  final bool isLogin;

  GetInitialData({this.number = "", this.isLogin = true});
}

class BackCall extends OtpEvent {}

class EventCallHandler with Helper {
  OtpState state;

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
      if (state.isLogin) {
        // callNextAndClearStack(BottomBar());
      } else {
        callNextAndReplaceScreen(ResetPasswordScreen(state.number));
      }
    }
  }
}
