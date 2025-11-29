import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/auth/manage/event/welcome_event.dart';
import 'package:leelaah/auth/manage/state/welcome_state.dart';
import 'package:leelaah/auth/screen/login_screen.dart';
import 'package:leelaah/auth/screen/signup_screen.dart';
import '../../../utils/helper.dart';


class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> with Helper {
  WelcomeBloc() : super(WelcomeState.initial()) {
    on<ClickCall>((event, emit) async {
      callNextAndReplaceScreen(SignupScreen());
    });

    on<SignupCall>((event, emit) async {
      callNextAndReplaceScreen(LoginScreen());
    });
  }
}
