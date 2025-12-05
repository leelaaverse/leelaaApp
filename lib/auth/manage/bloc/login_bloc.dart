import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/strings.dart';
import '../../../utils/helper.dart';
import '../../../utils/shared_preferences_handler.dart';
import '../../api_model/user_login_model.dart';
import '../../auth_repository.dart';
import '../../screen/forgot_screen.dart';
import '../../screen/signup_screen.dart';
import '../event/login_event.dart';
import '../state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with Helper {
  LoginBloc() : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, errorMessage: null));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, errorMessage: null));
    });
    on<PasswordEyeChange>((event, emit) {
      emit(state.copyWith(isEyeOpen: event.show, errorMessage: null));
    });

    on<LoginSubmitted>((event, emit) async {
      if (fieldCheck(state).isEmpty) {
        emit(state.copyWith(isSubmitting: true, errorMessage: null));
        Map<String, dynamic> loginResponse = await AuthRepository().userLogin(
          state.email,
          state.password,
        );

        print(loginResponse);

        if (loginResponse['msg'].isEmpty) {
          UserLoginModel response = UserLoginModel.fromJson(
            loginResponse['response'],
          );
          // emit(state.copyWith(number: response.phone ?? ""));
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } else {
          emit(
            state.copyWith(
              isSubmitting: false,
              errorMessage: loginResponse['msg'],
            ),
          );
        }
      } else {
        emit(
          state.copyWith(isSubmitting: false, errorMessage: fieldCheck(state)),
        );
      }
    });
    on<ForgotCall>((event, emit) async {
      callNextScreen(ForgotScreen());
    });
    on<SignupCall>((event, emit) async {
      callNextAndReplaceScreen(SignupScreen());
    });
    on<GoogleSubmitted>((event, emit) async {});
    on<AppleSubmitted>((event, emit) async {});
  }

  String fieldCheck(LoginState state) {
    if (state.email.isEmpty) {
      return "Please enter email";
    } else if (state.password.isEmpty) {
      return "Please enter password";
    } else {
      return "";
    }
  }
}
