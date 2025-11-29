import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/strings.dart';
import '../../../profile/screen/user_profile_screen.dart';
import '../../../utils/helper.dart';
import '../../../utils/shared_preferences_handler.dart';
import '../../api_model/dashboard_data_api_model.dart';
import '../../dashBoard_repository.dart';
import '../event/dashboard_event.dart';
import '../state/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> with Helper {
  DashboardBloc() : super(DashboardState.initial()) {
    on<CustomerClick>((event, emit) {
      emit(
        state.copyWith(
          clickCall: "customer",
          clickCustomerId: event.customerId,
        ),
      );
    });
    on<FilterOptionClick>((event, emit) {
      emit(state.copyWith(option: event.option, clickCall: ""));
    });

    on<MemberClick>((event, emit) {
      callNextScreen(UserProfileScreen("otherProfile"));
    });
    on<GenerateNewClick>((event, emit) {
      emit(state.copyWith(clickCall: "GenerateNewClick"));
    });
    on<HomeClick>((event, emit) {
      emit(state.copyWith(clickCall: "", bottomIndex: 0));
    });
    on<ExploreClick>((event, emit) {
      emit(state.copyWith(clickCall: "", bottomIndex: 1));
    });
    on<CommunityClick>((event, emit) {
      emit(state.copyWith(clickCall: "", bottomIndex: 2));
    });
    on<ReelsClick>((event, emit) {
      emit(state.copyWith(clickCall: "", bottomIndex: 3));
    });
    on<DrawerOpenClick>((event, emit) {
      emit(state.copyWith(clickCall: "DrawerOpenClick"));
    });
    on<NotificationListClick>((event, emit) {
      emit(state.copyWith(clickCall: "notification"));
    });
    on<ViewProfile>((event, emit) {
      emit(state.copyWith(clickCall: "viewProfile"));
      //index change
    });
    on<EditProfile>((event, emit) {
      emit(state.copyWith(clickCall: "editProfile"));
      //index change
    });
    on<CustomerViewAll>((event, emit) {
      emit(state.copyWith(clickCall: "customerViewAll"));
    });

    on<ProfileDrawerClick>((event, emit) {
      emit(state.copyWith(clickCall: "ProfileDrawerClick"));
    });
    on<PollDrawerClick>((event, emit) {
      emit(state.copyWith(clickCall: "PollDrawerClick"));
    });
    on<NotificationDrawerClick>((event, emit) {
      emit(state.copyWith(clickCall: "NotificationDrawerClick"));
    });
    on<SettingDrawerClick>((event, emit) {
      emit(state.copyWith(clickCall: "SettingDrawerClick"));
    });
    on<TermsDrawerClick>((event, emit) {
      emit(state.copyWith(clickCall: "TermsDrawerClick"));
    });
    on<LogoutDrawerClick>((event, emit) {
      emit(state.copyWith(clickCall: "LogoutDrawerClick"));
    });

    on<GetInitialData>((event, emit) async {
      emit(
        state.copyWith(
          clickCall: "",
          name: SharedPreferencesHandler().getStringData(userName),
          number: SharedPreferencesHandler().getStringData(userNumber),
          email: SharedPreferencesHandler().getStringData(userEmail),
          image: SharedPreferencesHandler().getStringData(userImage),
          option: "All",
          errorMessage: null,
        ),
      );

      Map<String, dynamic> response = await DashboardRepository()
          .dashBoardDataApi();

      if (response['msg']
          .toString()
          .isEmpty) {
        DashBoardDataApiModel dashBoardResponse =
        DashBoardDataApiModel.fromJson(response['response']);
        emit(
          state.copyWith(
            customerCount: dashBoardResponse.data!.totalCustomers,
            invoiceCount: dashBoardResponse.data!.totalInvoices,
            pCount: dashBoardResponse.data!.totalPrescriptions,
            customerList: dashBoardResponse.data!.recentCustomers,
          ),
        );
      } else {
        showErrorPopUp(response['msg']);
      }

      //index change
    });
  }
}
