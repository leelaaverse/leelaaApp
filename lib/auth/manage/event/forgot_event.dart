import '../../../network/loading_handler.dart';
import '../../../utils/helper.dart';
import '../../screen/otp_screen.dart';
import '../state/forgot_state.dart';

abstract class ForgotEvent {}

class DataChange extends ForgotEvent {
  final String email;

  DataChange({this.email = ""});
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
      showSuccessPopUp(state.successMessage, okPress: () {
        callBackScreen();
        callBackScreen();
      });
    }
  }
}
