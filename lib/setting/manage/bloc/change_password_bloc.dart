import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/event/change_password_event.dart';
import 'package:leelaah/setting/manage/state/change_password_state.dart';
import '../../../utils/helper.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState>
    with Helper {
  ChangePasswordBloc() : super(ChangePasswordState.initial()) {
    on<BackCall>((event, emit) async {
      callBackScreen();
    });

    on<onChangeCall>((event, emit) async {
      emit(
        state.copyWith(
          confirmPassword: event.confirmPassword.isEmpty
              ? state.confirmPassword
              : event.confirmPassword,
          oldPassword: event.oldPassword.isEmpty
              ? state.oldPassword
              : event.oldPassword,
          newPassword: event.newPassword.isEmpty
              ? state.newPassword
              : event.newPassword,
        ),
      );
    });

    on<MemberClick>((event, emit) {});

    on<CallDataSave>((event, emit) {
      callBackScreen();
    });
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
