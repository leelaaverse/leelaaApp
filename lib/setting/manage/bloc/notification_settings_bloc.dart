import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/event/notification_settings_event.dart';
import 'package:leelaah/setting/manage/state/notification_settings_state.dart';
import '../../../utils/helper.dart';

class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState>
    with Helper {
  NotificationSettingsBloc() : super(NotificationSettingsState.initial()) {
    on<BackCall>((event, emit) async {
      callBackScreen();
    });

    on<onChangeCall>((event, emit) async {
      emit(
        state.copyWith(
          muteYouDontFollow: event.muteYouDontFollow ?? state.muteYouDontFollow,
          muteWhoDontFollowYou:
          event.muteWhoDontFollowYou ?? state.muteWhoDontFollowYou,
          muteNewAccount: event.muteNewAccount ?? state.muteNewAccount,
          muteUnconfirmedEmail:
          event.muteUnconfirmedEmail ?? state.muteUnconfirmedEmail,
        ),
      );
    });

    on<CallDataSave>((event, emit) {});
    on<GetInitialData>((event, emit) async {
      // emit(state.copyWith(isLoading: true));
      emit(state.copyWith(errorMessage: "", isLoading: false));

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
