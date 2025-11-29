import 'package:flutter/material.dart';
import 'package:leelaah/notification/screen/notification_list_screen.dart';
import 'package:leelaah/profile/screen/user_profile_screen.dart';
import '../../../generate/screen/generate_screen.dart';
import '../../../setting/screen/setting_screen.dart';
import '../../../utils/helper.dart';
import '../bloc/dashboard_bloc.dart';
import '../state/dashboard_state.dart';

abstract class DashboardEvent {}

class CustomerClick extends DashboardEvent {
  final String customerId;

  CustomerClick(this.customerId);
}

class FilterOptionClick extends DashboardEvent {
  final String option;

  FilterOptionClick(this.option);
}

class GetInitialData extends DashboardEvent {}

class MemberClick extends DashboardEvent {
  var id;

  MemberClick(this.id);
}

class HomeClick extends DashboardEvent {}

class ExploreClick extends DashboardEvent {}

class CommunityClick extends DashboardEvent {}

class ReelsClick extends DashboardEvent {}

class GenerateNewClick extends DashboardEvent {}


class ViewProfile extends DashboardEvent {}

class EditProfile extends DashboardEvent {}

class CustomerViewAll extends DashboardEvent {}

class NotificationListClick extends DashboardEvent {}

class DrawerOpenClick extends DashboardEvent {}

// drawer calls

class ProfileDrawerClick extends DashboardEvent {}

class PollDrawerClick extends DashboardEvent {}

class NotificationDrawerClick extends DashboardEvent {}

class SettingDrawerClick extends DashboardEvent {}

class TermsDrawerClick extends DashboardEvent {}

class LogoutDrawerClick extends DashboardEvent {}

class EventCallHandler with Helper {
  DashboardState state;

  EventCallHandler(this.state);

  navigationCalls(context, DashboardBloc bloc) async {
    if (state.clickCall == "customerViewAll") {
      // bottomBloc.changeTab(1);
    } else if (state.clickCall == "viewProfile") {
      // bottomBloc.changeTab(3);
    } else if (state.clickCall == "DrawerOpenClick") {
      Scaffold.of(context).openDrawer();
    } else if (state.clickCall == "ProfileDrawerClick") {
      Scaffold.of(context).closeDrawer();
      callNextScreen(UserProfileScreen("ownProfile"));
    } else if (state.clickCall == "PollDrawerClick") {
      Scaffold.of(context).closeDrawer();
    } else if (state.clickCall == "NotificationDrawerClick") {
      Scaffold.of(context).closeDrawer();
      callNextScreen(NotificationListScreen());
      print("ad");
    } else if (state.clickCall == "SettingDrawerClick") {
      Scaffold.of(context).closeDrawer();
      callNextScreen(SettingScreen());
    } else if (state.clickCall == "TermsDrawerClick") {
      Scaffold.of(context).closeDrawer();
      print("ad");
    } else if (state.clickCall == "GenerateNewClick") {
      callNextScreen(GenerateScreen());
      print("ad");
    }
  }
}
