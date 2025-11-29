import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/bloc/privacy_safety_bloc.dart';
import 'package:leelaah/setting/manage/state/privacy_safety_state.dart';
import 'package:leelaah/setting/manage/event/privacy_safety_event.dart';
import '../../constants/app_colors.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_btn.dart';

class PrivacySafetyScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      PrivacySafetyBloc()
        ..add(GetInitialData()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(title: "Privacy Safety"),
        ),
        body: BlocConsumer<PrivacySafetyBloc, PrivacySafetyState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = context.read<PrivacySafetyBloc>();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Manage your privacy:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _buildCheckboxTile(
                    title: "Protect your profile photo",
                    value: state.protectProfilePhoto,
                    onChanged: (val) =>
                        bloc.add(onChangeCall(protectProfilePhoto: val!)),
                  ),
                  _buildCheckboxTile(
                    title: "Don’t show personal data",
                    value: state.personalDataHide,
                    onChanged: (val) =>
                        bloc.add(onChangeCall(personalDataHide: val!)),
                  ),
                  _buildCheckboxTile(
                    title: "Don’t show location details",
                    value: state.hideLocation,
                    onChanged: (val) =>
                        bloc.add(onChangeCall(hideLocation: val!)),
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
