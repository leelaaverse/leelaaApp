import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/helper.dart';
import '../../auth_repository.dart';
import '../../screen/login_screen.dart';
import '../event/signup_event.dart';
import '../state/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> with Helper {
  SignupBloc() : super(SignupState.initial()) {
    on<DataChange>((event, emit) {
      emit(
        state.copyWith(
          firstName: event.firstName,
          lastName: event.lastName,
          userName: event.userName,
          password: event.password,
          countryCode: event.countryCode,
          number: event.number,
          confirmPassword: event.confirmPassword,
          email: event.email,
          image: event.image,
          errorMessage: null,
          isSuccess: false,
        ),
      );
    });

    on<PasswordEyeChange>((event, emit) {
      emit(
        state.copyWith(
          isPasswordEyeOpen: event.passwordEye,
          isConfirmPasswordEyeOpen: event.confirmPasswordEye,
          errorMessage: null,
          isSuccess: false,
        ),
      );
    });

    on<SignUpSubmit>((event, emit) async {
      if (fieldCheck(state).isEmpty) {
        Map<String, dynamic> body = {
          "username": state.userName,
          "email": state.email,
          "password": state.password,
          "firstName": state.firstName,
          "lastName": state.lastName
        };
        emit(
          state.copyWith(
            isSubmitting: true,
            errorMessage: null,
            isSuccess: false,
          ),
        );
        String response = await AuthRepository().userRegister(
            body
        );

        if (response.isEmpty) {
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } else {
          emit(state.copyWith(isSubmitting: false, errorMessage: response));
        }
      } else {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: fieldCheck(state),
            isSuccess: false,
          ),
        );
      }
    });
    on<LoginCall>((event, emit) async {
      callNextAndReplaceScreen(LoginScreen());
    });
  }

  String fieldCheck(SignupState state) {
    if (state.firstName.isEmpty) {
      return "Please enter first name";
    } else if (state.lastName.isEmpty) {
      return "Please enter last name";
    } else if (state.email.isEmpty) {
      return "Please enter email";
    }
    /*else if (state.countryCode.isEmpty) {
      return "Please select Country Code";
    } else if (state.number.isEmpty) {
      return "Please enter phone number";
    } else if (state.number.length < 10) {
      return "Please enter valid phone number";
    } */ else if (state.password.isEmpty) {
      return "Please enter password";
    } else if (state.password.length < 6) {
      return "Password must be of 6 digits";
    } else if (state.confirmPassword.isEmpty) {
      return "Please enter confirm password";
    } else if (state.password != state.confirmPassword) {
      return "Password don't match";
    } else {
      return "";
    }
  }
}
