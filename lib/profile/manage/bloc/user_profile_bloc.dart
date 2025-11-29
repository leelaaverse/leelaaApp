import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/profile/manage/event/user_profile_event.dart';
import 'package:leelaah/profile/manage/state/user_profile_state.dart';
import '../../../utils/helper.dart';
import '../../screen/user_profile_screen.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState>
    with Helper {
  UserProfileBloc() : super(UserProfileState.initial()) {
    on<ChangeOptionSelected>((event, emit) async {
      emit(state.copyWith(option: event.option ?? "Active"));
    });
    on<BackCall>((event, emit) async {
      callBackScreen();
    });
    on<MemberClick>((event, emit) {
      callNextScreen(UserProfileScreen("otherProfile"));
    });
    on<GetInitialData>((event, emit) async {
      emit(state.copyWith(userFor: event.userFor));
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
