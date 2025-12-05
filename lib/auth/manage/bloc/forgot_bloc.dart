import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper.dart';
import '../../auth_repository.dart';
import '../event/forgot_event.dart';
import '../state/forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> with Helper {
  ForgotBloc() : super(ForgotState.initial()) {
    on<DataChange>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<SubmitCall>((event, emit) async {
      if (!state.email.isEmpty) {
        emit(state.copyWith(isSubmitting: true, errorMessage: null));
        Map<String, dynamic> response = await AuthRepository()
            .forgotPasswordAPi(state.email);

        if (response['success']) {
          emit(
            state.copyWith(
              isSubmitting: false,
              isSuccess: true,
              successMessage: response['msg'],
            ),
          );
        } else {
          emit(
            state.copyWith(isSubmitting: false, errorMessage: response['msg']),
          );
        }
      } else {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: "Please enter email",
          ),
        );
      }
    });

    on<BackCall>((event, emit) async {
      callBackScreen();
    });
  }
}
