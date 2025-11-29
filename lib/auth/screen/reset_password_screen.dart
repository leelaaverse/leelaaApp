import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../constants/strings.dart';
import '../../utils/helper.dart';
import '../../widget/custom_btn.dart';
import '../../widget/text_field.dart';
import '../manage/bloc/reset_password_bloc.dart';
import '../manage/event/reset_password_event.dart';
import '../manage/state/reset_password_state.dart';

class ResetPasswordScreen extends StatelessWidget with Helper {
  String number;

  ResetPasswordScreen(this.number);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      ResetPasswordBloc()
        ..add(GetInitialData(number: number)),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: SweepGradient(
            center: Alignment.topRight,
            startAngle: 0,
            tileMode: TileMode.mirror,
            endAngle: 1,
            colors: [Color(0XFFFFFFFF), Color(0XFFC7C9EB), Color(0XFF9B9FE8)],
            stops: [0.2, 0.5, 1],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                EventCallHandler(state).click();
              },
              child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                builder: (context, state) {
                  final bloc = context.read<ResetPasswordBloc>();

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => bloc.add(BackCall()),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 2),
                            child: Icon(Icons.arrow_back_ios_new_sharp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight * 0.06),

                              Center(child: Image.asset(logo, width: 200)),
                              SizedBox(height: screenHeight * 0.06),
                              Text(
                                txtResetPassword,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                "No worries — just set a new password.",
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(height: 30),

                              SizedBox(height: 15),
                              CustomTextField(
                                isPassword: true,
                                onChanged:
                                    (value) =>
                                    bloc.add(
                                      DataChange(
                                        password: value,
                                        confirmPassword: state.confirmPassword,
                                      ),
                                    ),
                                hintText: "Password",
                                obscureText: !state.isPasswordEyeOpen,
                                textInputAction: TextInputAction.next,
                                eyeCheck: state.isPasswordEyeOpen,
                                onEyeClick:
                                    () =>
                                    bloc.add(
                                      PasswordEyeChange(
                                        passwordEye: !state.isPasswordEyeOpen,
                                      ),
                                    ),
                              ),
                              SizedBox(height: 15),
                              CustomTextField(
                                isPassword: true,
                                onChanged:
                                    (value) =>
                                    bloc.add(
                                      DataChange(
                                        confirmPassword: value,
                                        password: state.password,
                                      ),
                                    ),
                                hintText: "Confirm Password",
                                obscureText: !state.isConfirmPasswordEyeOpen,
                                textInputAction: TextInputAction.done,
                                eyeCheck: state.isConfirmPasswordEyeOpen,
                                onEyeClick:
                                    () =>
                                    bloc.add(
                                      PasswordEyeChange(
                                        confirmPasswordEye:
                                        !state.isConfirmPasswordEyeOpen,
                                      ),
                                    ),
                              ),

                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: CustomButton(
                                  label: "Submit",
                                  color: AppColors.appColor,
                                  labelColor: Colors.white,
                                  onPressed:
                                  state.isSubmitting
                                      ? null
                                      : () => bloc.add(SubmitPassword()),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
