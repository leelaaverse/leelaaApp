import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/constants/app_colors.dart';
import 'package:leelaah/setting/manage/bloc/change_password_bloc.dart';
import 'package:leelaah/setting/manage/state/change_password_state.dart';
import 'package:leelaah/setting/manage/event/change_password_event.dart';
import 'package:leelaah/widget/custom_appbar.dart';
import 'package:leelaah/widget/custom_btn.dart';
import 'package:leelaah/widget/text_field.dart';
import '../../utils/helper.dart';

class ChangePasswordScreen extends StatelessWidget with Helper {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      ChangePasswordBloc()
        ..add(GetInitialData()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(title: "Change Password"),
        ),
        body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            final bloc = context.read<ChangePasswordBloc>();

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        CustomTextField(
                          hintText: "Old Password",
                          controller: oldPassword,
                          isPassword: true,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: "New Password",
                          controller: newPassword,
                          isPassword: true,

                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: "Confirm Password",
                          controller: confirmPassword,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 40,
                  ),
                  child: CustomButton(
                    paddingVertical: 14,
                    label: "Save",
                    onPressed: () => bloc.add(CallDataSave()),
                    color: AppColors.appColor,
                    labelColor: Colors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }


}
