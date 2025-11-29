import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/setting/manage/event/account_event.dart';
import '../../../utils/helper.dart';
import '../state/account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> with Helper {
  AccountBloc() : super(AccountState.initial()) {
    on<BackCall>((event, emit) async {
      callBackScreen();
    });

    on<onChangeCall>((event, emit) async {
      emit(
        state.copyWith(
          email: event.email.isEmpty ? state.email : event.email,
          userName: event.username.isEmpty ? state.userName : event.username,
          dob: event.dob.isEmpty ? state.dob : event.dob,
          address: event.address.isEmpty ? state.address : event.address,
          gender: event.gender.isEmpty ? state.gender : event.gender,
        ),
      );
    });

    on<MemberClick>((event, emit) {});
    on<MakeEditableCall>((event, emit) {
      emit(state.copyWith(isEditable: true));
    });
    on<CallDataSave>((event, emit) {
      emit(state.copyWith(isEditable: false));
    });
    on<GetInitialData>((event, emit) async {
      // emit(state.copyWith(isLoading: true));
      emit(
        state.copyWith(
          errorMessage: "",
          isLoading: false,
          email: "asdasd@sad.asds",
          userName: "asdasd",
          dob: "10-2-2025",
          address: "asdasd",
          gender: "male",
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
