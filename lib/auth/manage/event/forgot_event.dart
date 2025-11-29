import '../../../network/loading_handler.dart';
import '../../../utils/helper.dart';
import '../../screen/otp_screen.dart';
import '../state/forgot_state.dart';

abstract class ForgotEvent {}

class DataChange extends ForgotEvent {
  final String number;

  DataChange({this.number = ""});
}

class SubmitCall extends ForgotEvent {}

class BackCall extends ForgotEvent {}

class EventCallHandler with Helper {
  ForgotState state;

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
      callNextAndReplaceScreen(OtpScreen(state.number, isLogin: false));
    }
  }
}
