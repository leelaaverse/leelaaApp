import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper.dart';
import '../event/notification_list_event.dart';
import '../state/notification_list_state.dart';

class NotificationListBloc
    extends Bloc<NotificationListEvent, NotificationListState>
    with Helper {
  NotificationListBloc() : super(NotificationListState.initial()) {
    on<GetInitialData>((event, emit) async {
      // emit(state.copyWith(isLoading: true));
      var list = ["sadasd", "sadasd"];
      emit(state.copyWith(
        notificationList: list,
        errorMessage: "",
        isLoading: false,
      ));

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
