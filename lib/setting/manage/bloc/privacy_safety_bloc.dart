import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/event/privacy_safety_event.dart';
import '../../../utils/helper.dart';
import '../state/privacy_safety_state.dart';

class PrivacySafetyBloc extends Bloc<PrivacySafetyEvent, PrivacySafetyState>
    with Helper {
  PrivacySafetyBloc() : super(PrivacySafetyState.initial()) {
    on<BackCall>((event, emit) async {
      callBackScreen();
    });

    on<onChangeCall>((event, emit) async {
      emit(
        state.copyWith(
          hideLocation: event.hideLocation ?? state.hideLocation,
          personalDataHide: event.personalDataHide ?? state.personalDataHide,
          protectProfilePhoto:
          event.protectProfilePhoto ?? state.protectProfilePhoto,
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
