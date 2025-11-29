import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/generate/manage/event/generate_event.dart';
import '../../../utils/helper.dart';
import '../state/generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> with Helper {
  GenerateBloc() : super(GenerateState.initial()) {
    on<ChangeOptionSelected>((event, emit) async {
      emit(state.copyWith(option: event.option ?? "Active"));
    });
    on<BackCall>((event, emit) async {
      callBackScreen();
    });
    on<MemberClick>((event, emit) {
      // callNextScreen(UserProfileScreen("otherProfile"));
    });
    on<GetInitialData>((event, emit) async {
      // emit(state.copyWith(userFor: event.userFor));
      // emit(state.copyWith(isLoading: true));
      var list = ["sadasd", "sadasd"];
      emit(
        state.copyWith(
          notificationList: list,
          errorMessage: "",
          isLoading: false,
        ),
      );

      // Map<String, dynamic> apiResponse =
      //     await GenerateRepository().invoiceListApi();
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
    });
  }
}
