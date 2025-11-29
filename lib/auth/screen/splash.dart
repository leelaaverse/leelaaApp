import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/auth/screen/welcome_screen.dart';
import 'package:leelaah/dashboard/screen/dashboard.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../constants/strings.dart';
import '../../utils/helper.dart';
import '../../utils/shared_preferences_handler.dart';
import '../manage/bloc/splash_bloc.dart';
import '../manage/event/splash_event.dart';
import '../manage/state/splash_state.dart';

class SplashScreen extends StatelessWidget with Helper {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      SplashBloc()
        ..add(StartCall()),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state.changeScreen) {
              Future.delayed(Duration(seconds: 2), () {
                callNextAndReplaceScreen(
                  SharedPreferencesHandler()
                      .getStringData(appToken)
                      .isEmpty
                      ? WelcomeScreen()
                      : Dashboard(),
                );
              });
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(logo),
                  SizedBox(height: 25),
                  CircularProgressIndicator(color: AppColors.appColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
