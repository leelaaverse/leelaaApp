import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/bloc/notification_settings_bloc.dart';
import 'package:leelaah/setting/manage/state/notification_settings_state.dart';
import 'package:leelaah/setting/manage/event/notification_settings_event.dart';

import '../../constants/app_colors.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_btn.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      NotificationSettingsBloc()
        ..add(GetInitialData()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(title: "Notification Settings"),
        ),
        body: BlocConsumer<NotificationSettingsBloc, NotificationSettingsState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            final bloc = context.read<NotificationSettingsBloc>();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Mute notifications from people:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _buildCheckboxTile(
                    title: "You don’t follow",
                    value: state.muteYouDontFollow,
                    onChanged: (val) =>
                        bloc.add(onChangeCall(muteYouDontFollow: val!)),
                  ),
                  _buildCheckboxTile(
                    title: "Who don’t follow you",
                    value: state.muteWhoDontFollowYou,
                    onChanged: (val) =>
                        bloc.add(onChangeCall(muteWhoDontFollowYou: val!)),
                  ),
                  _buildCheckboxTile(
                    title: "With a new account",
                    value: state.muteNewAccount,
                    onChanged: (val) =>
                        bloc.add(onChangeCall(muteNewAccount: val!)),
                  ),
                  _buildCheckboxTile(
                    title: "Who haven’t confirmed their email",
                    value: state.muteUnconfirmedEmail,
                    onChanged: (val) =>
                        bloc.add(onChangeCall(muteUnconfirmedEmail: val!)),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: CustomButton(
                      paddingVertical: 14,
                      label: "Save",
                      onPressed: () => bloc.add(CallDataSave()),
                      color: AppColors.appColor,
                      labelColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCheckboxTile({
    required String title,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      checkColor: AppColors.white,
      activeColor: AppColors.appColor,
      title: Text(title, style: const TextStyle(fontSize: 15)),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
