import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/helper.dart';
import '../../auth_repository.dart';
import '../event/otp_event.dart';
import '../state/otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> with Helper {
  OtpBloc() : super(OtpState.initial()) {
    on<DataChange>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });

    on<SubmitCall>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, errorMessage: null));
      String response = await AuthRepository().verifyOtp(
        state.number,
        state.otp,
        state.isLogin,
      );

      if (response.isEmpty) {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        emit(state.copyWith(isSubmitting: false, errorMessage: response));
      }
    });

    on<BackCall>((event, emit) async {
      callBackScreen();
    });

    on<ResendOtp>((event, emit) async {
      String response = await AuthRepository().sendOtpApi(state.number);
      if (response.isEmpty) {
        emit(state.copyWith(resendEnable: false));
        callSnackBar("Verification Code Send Please Check",
            title: 'Verification Code Send');
      } else {
        callSnackBar(response);
      }
    });

    on<TimeChange>((event, emit) {
      emit(
        state.copyWith(resendEnable: event.isEnable, displayTime: event.time),
      );

      //index change
    });
    on<GetInitialData>((event, emit) {
      emit(
        state.copyWith(
          number: event.number,
          isLogin: event.isLogin,
          errorMessage: null,
          resendEnable: false,
        ),
      );
      //index change
    });
  }
}
