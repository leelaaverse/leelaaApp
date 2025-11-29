import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/bloc/setting_bloc.dart';
import 'package:leelaah/setting/manage/state/setting_state.dart';
import 'package:leelaah/setting/manage/event/setting_event.dart';
import 'package:leelaah/widget/custom_appbar.dart';
import 'package:leelaah/widget/custom_btn.dart';
import '../../auth/screen/login_screen.dart';
import '../../utils/helper.dart';

class SettingScreen extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      SettingBloc()
        ..add(GetInitialData()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(title: "Setting & Privacy"),
        ),
        body: BlocConsumer<SettingBloc, SettingState>(
          listener: (context, state) {
            if (state.clickCall == "DeleteAccountClick") {
              Scaffold.of(context).closeDrawer();
              showYesNoPopUp(
                msg: "Are you sure you want to delete the account?",
                title: "Delete Account",
                onYesPress: () {
                  callNextAndClearStack(LoginScreen());
                },
              );
            }
          },
          builder: (context, state) {
            final bloc = context.read<SettingBloc>();

            return Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      itemWidget(
                        "Account Details",
                            () => bloc.add(AccountItemClick()),
                      ),
                      itemWidget(
                        "Change Password",
                            () => bloc.add(ChangePasswordItemClick()),
                      ),
                      itemWidget(
                        "Notifications",
                            () => bloc.add(NotificationItemClick()),
                      ),
                      itemWidget(
                        "Privacy Safety",
                            () => bloc.add(PrivacyItemClick()),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 40,
                  ),
                  child: CustomButton(
                    paddingVertical: 12,
                    label: "Delete Account",
                    onPressed: () => bloc.add(DeleteAccountClick()),
                    color: Colors.red,
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

  Widget itemWidget(String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black38, blurRadius: 8,)
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Icon(Icons.navigate_next, size: 26),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
