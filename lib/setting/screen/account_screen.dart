import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/constants/app_colors.dart';
import 'package:leelaah/setting/manage/bloc/account_bloc.dart';
import 'package:leelaah/setting/manage/state/account_state.dart';
import 'package:leelaah/setting/manage/event/account_event.dart';
import 'package:leelaah/widget/custom_appbar.dart';
import 'package:leelaah/widget/custom_btn.dart';
import 'package:leelaah/widget/text_field.dart';
import '../../auth/screen/login_screen.dart';
import '../../utils/helper.dart';

class AccountScreen extends StatelessWidget with Helper {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      AccountBloc()
        ..add(GetInitialData()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(title: "Account Details"),
        ),
        body: BlocConsumer<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state.email.isNotEmpty && email.text.isEmpty) {
              email.text = state.email;
            }
            if (state.userName.isNotEmpty && userName.text.isEmpty) {
              userName.text = state.userName;
            }
            if (state.dob.isNotEmpty && dob.text.isEmpty) {
              dob.text = state.dob;
            }
            if (state.address.isNotEmpty && address.text.isEmpty) {
              address.text = state.address;
            }
            if (state.gender.isNotEmpty && gender.text.isEmpty) {
              gender.text = state.gender;
            }
          },
          builder: (context, state) {
            final bloc = context.read<AccountBloc>();

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
                          hintText: "UserName",
                          controller: userName,
                          enabledReadonly: !state.isEditable,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: "Email",
                          controller: email,
                          enabledReadonly: !state.isEditable,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: "DOB",
                          controller: dob,
                          enabledReadonly: !state.isEditable,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: "Gender",
                          controller: gender,
                          enabledReadonly: !state.isEditable,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: "Address",
                          controller: address,
                          enabledReadonly: !state.isEditable,
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
                    label: state.isEditable ? "Save" : "Edit",
                    onPressed: () =>
                    state.isEditable
                        ? bloc.add(CallDataSave())
                        : bloc.add(MakeEditableCall()),
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
