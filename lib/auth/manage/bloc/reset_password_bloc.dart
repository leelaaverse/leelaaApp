import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/helper.dart';
import '../../auth_repository.dart';
import '../event/reset_password_event.dart';
import '../state/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState>
    with Helper {
  ResetPasswordBloc() : super(ResetPasswordState.initial()) {
    on<DataChange>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          confirmPassword: event.confirmPassword,
          errorMessage: null,
        ),
      );
    });

    on<PasswordEyeChange>((event, emit) {
      emit(
        state.copyWith(
          isPasswordEyeOpen: event.passwordEye,
          isConfirmPasswordEyeOpen: event.confirmPasswordEye,
          errorMessage: null,
        ),
      );
    });

    on<SubmitPassword>((event, emit) async {
      if (fieldCheck(state).isEmpty) {
        emit(state.copyWith(isSubmitting: true, errorMessage: null));
        String response = await AuthRepository().resetPasswordApi(
          state.number,
          state.password,
        );

        if (response.isEmpty) {
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } else {
          emit(state.copyWith(isSubmitting: false, errorMessage: response));
        }
      } else {
        emit(
          state.copyWith(isSubmitting: false, errorMessage: fieldCheck(state)),
        );
      }
    });

    on<GetInitialData>((event, emit) {
      emit(state.copyWith(number: event.number, errorMessage: null));
      //index change
    });

    on<BackCall>((event, emit) async {
      callBackScreen();
    });
  }

  String fieldCheck(ResetPasswordState state) {
    if (state.password.isEmpty) {
      return "Please enter password";
    } else if (state.confirmPassword.isEmpty) {
      return "Please enter confirm password";
    } else if (state.confirmPassword != state.password) {
      return "Password don't match";
    } else {
      return "";
    }
  }
}
