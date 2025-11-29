import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../constants/strings.dart';
import '../../utils/helper.dart';
import '../../widget/custom_btn.dart';
import '../manage/bloc/otp_bloc.dart';
import '../manage/event/otp_event.dart';
import '../manage/state/otp_state.dart';

class OtpScreen extends StatelessWidget with Helper {
  String number;
  bool isLogin;

  OtpScreen(this.number, {this.isLogin = true});

  var time = "0";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
      OtpBloc()
        ..add(GetInitialData(number: number, isLogin: isLogin)),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocListener<OtpBloc, OtpState>(
            listener: (context, state) {
              final bloc = context.read<OtpBloc>();
              EventCallHandler(state).click();
              if (!state.resendEnable) {
                startTimer(state, bloc);
              }
            },
            child: BlocBuilder<OtpBloc, OtpState>(
              builder: (context, state) {
                final bloc = context.read<OtpBloc>();

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
                            Text(
                              "We sent you a code",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "Enter it below to verify account",
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: screenHeight * 0.06),

                            _buildOtpInput(bloc),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 13),
                                    children: [
                                      TextSpan(
                                        text: "Haven't received? ",
                                        style: TextStyle(
                                          color:
                                          state.displayTime == time
                                              ? AppColors.appColor
                                              : AppColors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        recognizer:
                                        TapGestureRecognizer()
                                          ..onTap =
                                          state.displayTime != time
                                              ? null
                                              : () =>
                                              bloc.add(ResendOtp()),
                                        text: "Resend",
                                        style: TextStyle(
                                          color:
                                          state.displayTime == time
                                              ? AppColors.appColor
                                              : AppColors.grey,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          decorationColor: AppColors.appColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            state.displayTime == time
                                ? Container()
                                : Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  state.displayTime.length == 1
                                      ? "00:0${state.displayTime}"
                                      : "00:${state.displayTime}",
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
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
                                    : () => bloc.add(SubmitCall()),
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
    );
  }

  Timer? timer;

  void startTimer(OtpState state, OtpBloc bloc) {
    int start = 60;
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (start == 0) {
        timer.cancel();
        // bloc.add(TimeChange(start.toString(),false));
      } else {
        start--;
      }
      bloc.add(TimeChange(start.toString(), true));
      // print(state.startTime);
      print(start);
    });
  }

  timerStop() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  // otp input field
  Widget _buildOtpInput(OtpBloc bloc) {
    return OtpTextField(
      fillColor: AppColors.white,
      enabledBorderColor: AppColors.black,
      focusedBorderColor: AppColors.black,
      cursorColor: AppColors.black,
      fieldWidth: 45,
      margin: EdgeInsets.symmetric(horizontal: 5),
      filled: false,
      numberOfFields: 6,
      showFieldAsBox: true,
      onCodeChanged: (String code) => bloc.add(DataChange(otp: code)),
      onSubmit: (String code) => bloc.add(DataChange(otp: code)),
    );
  }
}
