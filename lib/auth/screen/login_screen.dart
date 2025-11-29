import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../constants/strings.dart';
import '../../utils/helper.dart';
import '../../widget/custom_btn.dart';
import '../../widget/custom_outline_btn.dart';
import '../../widget/text_field.dart';
import '../manage/bloc/login_bloc.dart';
import '../manage/event/login_event.dart';
import '../manage/state/login_state.dart';

class LoginScreen extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              EventCallHandler(state).submitClick();
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final bloc = context.read<LoginBloc>();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.09),
                      Text(
                        "To begin, enter your\nphone number/email\naddress.",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        onChanged: (value) => bloc.add(EmailChanged(value)),
                        hintText: "Email/Phone",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        isPassword: true,
                        onChanged: (value) => bloc.add(PasswordChanged(value)),
                        hintText: "Password",
                        obscureText: !state.isEyeOpen,
                        textInputAction: TextInputAction.done,
                        eyeCheck: state.isEyeOpen,
                        onEyeClick: () =>
                            bloc.add(PasswordEyeChange(!state.isEyeOpen)),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => bloc.add(ForgotCall()),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CustomButton(
                          label: "Login",
                          color: AppColors.appColor,
                          labelColor: Colors.white,
                          onPressed: state.isSubmitting
                              ? null
                              : () => bloc.add(LoginSubmitted()),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                text: "Don’t have an account? ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => bloc.add(SignupCall()),
                                text: "Signup",
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
                      const SizedBox(height: 45),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColors.lightGrey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CustomOutlineBtn(
                          image: google,
                          label: "Sign in with Google",
                          color: AppColors.appColor,
                          onPressed: state.isSubmitting
                              ? null
                              : () => bloc.add(GoogleSubmitted()),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),

                        child: CustomOutlineBtn(
                          image: apple,
                          label: "Sign in with Apple",
                          color: AppColors.appColor,
                          onPressed: state.isSubmitting
                              ? null
                              : () => bloc.add(AppleSubmitted()),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
