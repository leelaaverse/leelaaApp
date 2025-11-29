import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper.dart';
import '../../auth_repository.dart';
import '../event/forgot_event.dart';
import '../state/forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> with Helper {
  ForgotBloc() : super(ForgotState.initial()) {
    on<DataChange>((event, emit) {
      emit(state.copyWith(number: event.number));
    });

    on<SubmitCall>((event, emit) async {
      if (!state.number.isEmpty) {
        emit(state.copyWith(isSubmitting: true, errorMessage: null));
        String response = await AuthRepository().sendOtpApi(state.number);

        if (response.isEmpty) {
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } else {
          emit(state.copyWith(isSubmitting: false, errorMessage: response));
        }
      } else {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: "Please enter number",
          ),
        );
      }
    });

    on<BackCall>((event, emit) async {
      callBackScreen();
    });
  }
}
