import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/helper.dart';
import '../event/splash_event.dart';
import '../state/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> with Helper {
  SplashBloc() : super(SplashState.initial()) {
    on<StartCall>((event, emit) async {
      emit(state.copyWith(changeScreen: true));

      // Future.delayed(Duration(seconds: 2), () {
      //   callNextAndReplaceScreen(LoginScreen());
      // });
    });
  }
}
