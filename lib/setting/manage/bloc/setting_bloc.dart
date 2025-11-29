import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/state/setting_state.dart';
import 'package:leelaah/setting/screen/account_screen.dart';
import 'package:leelaah/setting/screen/change_password_screen.dart';
import 'package:leelaah/setting/screen/privacy_safety_screen.dart';
import '../../../utils/helper.dart';
import '../../screen/notification_settings_screen.dart';
import '../event/setting_event.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> with Helper {
  SettingBloc() : super(SettingState.initial()) {
    on<ChangeOptionSelected>((event, emit) async {
      emit(state.copyWith(option: event.option ?? "Active", clickCall: ""));
    });
    on<BackCall>((event, emit) async {
      callBackScreen();
    });
    on<MemberClick>((event, emit) {});
    on<DeleteAccountClick>((event, emit) {
      emit(state.copyWith(clickCall: "DeleteAccountClick"));
    });
    on<ChangePasswordItemClick>((event, emit) {
      emit(state.copyWith(clickCall: ""));
      callNextScreen(ChangePasswordScreen());
    });
    on<AccountItemClick>((event, emit) {
      emit(state.copyWith(clickCall: ""));
      callNextScreen(AccountScreen());
    });
    on<NotificationItemClick>((event, emit) {
      emit(state.copyWith(clickCall: ""));
      callNextScreen(NotificationSettingsScreen());
    });
    on<PrivacyItemClick>((event, emit) {
      emit(state.copyWith(clickCall: ""));
      callNextScreen(PrivacySafetyScreen());
    });
    on<GetInitialData>((event, emit) async {
      // emit(state.copyWith(isLoading: true));
      var list = ["sadasd", "sadasd"];
      emit(
        state.copyWith(
          notificationList: list,
          errorMessage: "",
          isLoading: false,
          clickCall: "",
        ),
      );

      // Map<String, dynamic> apiResponse =
      //     await NotificationRepository().invoiceListApi();
      //
      // if (apiResponse['msg'].toString().isEmpty) {
      //   InvoiceListingApiModel response = InvoiceListingApiModel.fromJson(
      //     apiResponse['response'],
      //   );
      //   emit(state.copyWith(errorMessage: "", isLoading: false));
      // } else {
      //   emit(
      //     state.copyWith(
      //       invoiceList: [],
      //       errorMessage: apiResponse['msg'],
      //       isLoading: false,
      //     ),
      //   );
      // }

      //index change
    });
  }
}
