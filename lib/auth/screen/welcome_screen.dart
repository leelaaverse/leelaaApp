import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/auth/manage/bloc/welcome_bloc.dart';
import 'package:leelaah/auth/manage/event/welcome_event.dart';
import 'package:leelaah/auth/manage/state/welcome_state.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../constants/strings.dart';
import '../../utils/helper.dart';
import '../../utils/shared_preferences_handler.dart';
import '../../widget/custom_btn.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget with Helper {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeBloc(),
      child: Scaffold(
        body: BlocListener<WelcomeBloc, WelcomeState>(
          listener: (context, state) {},
          child: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              final bloc = context.read<WelcomeBloc>();

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    // Image.asset(logo, width: 120),
                    Text("Leelaa", style: TextStyle(
                        color: AppColors.appColor,
                        fontSize: 45
                    ),),

                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      "Stay updated\non what's happening\nin the world right now.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.07),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomButton(
                        label: "Create account",
                        color: AppColors.appColor,
                        labelColor: Colors.white,
                        onPressed: () => bloc.add(ClickCall()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 15),
                          children: [
                            TextSpan(
                              text: "Have an account already? ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => bloc.add(SignupCall()),
                              text: "SignIn",
                              style: TextStyle(
                                color: AppColors.appColor,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.appColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
