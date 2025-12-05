import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/app_colors.dart';
import '../../utils/helper.dart';
import '../../widget/custom_btn.dart';
import '../../widget/text_field.dart';
import '../manage/bloc/signup_bloc.dart';
import '../manage/event/signup_event.dart';
import '../manage/state/signup_state.dart';

class SignupScreen extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              EventCallHandler(state).click();
            },
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                final bloc = context.read<SignupBloc>();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        "Create your new\naccount",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state.image.isEmpty
                              ? GestureDetector(
                            onTap: () async {
                              ImagePicker picker = ImagePicker();
                              var result = await picker.pickImage(
                                source: ImageSource.camera,
                              );
                              bloc.add(
                                DataChange(image: result?.path ?? ""),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                  ),

                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.appColor,
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                  ),

                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(state.image ?? ""),
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  bloc.add(DataChange(image: ""));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),

                                  child: Icon(
                                    Icons.cancel,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              onChanged: (value) =>
                                  bloc.add(DataChange(firstName: value)),
                              hintText: "First Name",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: CustomTextField(
                              onChanged: (value) =>
                                  bloc.add(DataChange(lastName: value)),
                              hintText: "Last Name",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        onChanged: (value) =>
                            bloc.add(DataChange(userName: value)),
                        hintText: "UserName",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        onChanged: (value) =>
                            bloc.add(DataChange(email: value)),
                        hintText: "Email",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      // SizedBox(height: 15),
                      // IntrinsicHeight(
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         flex: 2,
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             showCountryPicker(
                      //               context: context,
                      //               showPhoneCode: true,
                      //               favorite: ['in', 'us', 'ca', 'au', 'nz'],
                      //               countryListTheme: CountryListThemeData(
                      //                 bottomSheetHeight: screenHeight * 0.6,
                      //               ),
                      //               // optional. Shows phone code before the country name.
                      //               onSelect: (Country country) =>
                      //                   bloc.add(
                      //                     DataChange(
                      //                       countryCode: "+${country
                      //                           .phoneCode}",
                      //                     ),
                      //                   ),
                      //             );
                      //           },
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(5),
                      //               border: Border.all(
                      //                 color: Colors.white70,
                      //                 width: 1,
                      //               ),
                      //             ),
                      //             child: Center(
                      //               child: Text(
                      //                 state.countryCode,
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 14,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(width: 10),
                      //       Expanded(
                      //         flex: 10,
                      //         child: CustomTextField(
                      //           onChanged: (value) =>
                      //               bloc.add(DataChange(number: value)),
                      //           hintText: "Phone Number",
                      //           textInputAction: TextInputAction.next,
                      //           maxLength: 10,
                      //           keyboardType: TextInputType.number,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 15),
                      CustomTextField(
                        isPassword: true,
                        onChanged: (value) =>
                            bloc.add(DataChange(password: value)),
                        hintText: "Password",
                        obscureText: !state.isPasswordEyeOpen,
                        textInputAction: TextInputAction.next,
                        eyeCheck: state.isPasswordEyeOpen,
                        onEyeClick: () =>
                            bloc.add(
                              PasswordEyeChange(
                                passwordEye: !state.isPasswordEyeOpen,
                              ),
                            ),
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        isPassword: true,
                        onChanged: (value) =>
                            bloc.add(DataChange(confirmPassword: value)),
                        hintText: "Confirm Password",
                        obscureText: !state.isConfirmPasswordEyeOpen,
                        textInputAction: TextInputAction.done,
                        eyeCheck: state.isConfirmPasswordEyeOpen,
                        onEyeClick: () =>
                            bloc.add(
                              PasswordEyeChange(
                                confirmPasswordEye: !state
                                    .isConfirmPasswordEyeOpen,
                              ),
                            ),
                      ),

                      const SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CustomButton(
                          label: "SignUp",
                          color: AppColors.appColor,
                          labelColor: Colors.white,
                          onPressed: state.isSubmitting
                              ? null
                              : () => bloc.add(SignUpSubmit()),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => bloc.add(LoginCall()),
                                text: "Login",
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
      ),
    );
  }
}
