import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../constants/strings.dart';
import '../../utils/helper.dart';
import '../../widget/custom_btn.dart';
import '../../widget/text_field.dart';
import '../manage/bloc/forgot_bloc.dart';
import '../manage/event/forgot_event.dart';
import '../manage/state/forgot_state.dart';

class ForgotScreen extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotBloc(),
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocListener<ForgotBloc, ForgotState>(
            listener: (context, state) {
              EventCallHandler(state).click();
            },
            child: BlocBuilder<ForgotBloc, ForgotState>(
              builder: (context, state) {
                final bloc = context.read<ForgotBloc>();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => bloc.add(BackCall()),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 2),
                          child: Icon(Icons.arrow_back_ios_new_sharp,
                            color: Colors.white,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHeight * 0.06),
                            Center(child: Image.asset(logo, width: 200,
                              fit: BoxFit.fitWidth,)),
                            SizedBox(height: screenHeight * 0.06),
                            Text(
                              txtForgotPassword,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "No stress, We’ll help you get back in.",
                              style: TextStyle(fontSize: 13,
                                  color: Colors.white70),
                            ),
                            SizedBox(height: 25),
                            CustomTextField(
                              onChanged:
                                  (value) =>
                                      bloc.add(DataChange(email: value)),
                              hintText: "Email",
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 25),
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
}
