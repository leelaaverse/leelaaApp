import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_colors.dart';
import '../../utils/helper.dart';
import '../../widget/custom_appbar.dart';
import '../manage/bloc/notification_list_bloc.dart';
import '../manage/state/notification_list_state.dart';
import '../manage/event/notification_list_event.dart';

class NotificationListScreen extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      NotificationListBloc()
        ..add(GetInitialData()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(title: "Notifications"),
        ),
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<NotificationListBloc, NotificationListState>(
          builder: (context, state) {
            final bloc = context.read<NotificationListBloc>();

            return state.isLoading
                ? Center(
              child: CircularProgressIndicator(
                color: AppColors.appColor,
              ),
            )
                : state.errorMessage.isNotEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                : state.notificationList.isEmpty
                ? Center(
              child: Text(
                "No Notifications",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 15,
                itemBuilder: (context, index) {
                  // var item = state.notificationList[index];
                  return listItemWidget(bloc);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget listItemWidget(NotificationListBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)],
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("dsfsdfsdfsdf", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text(
                        "12h ago",
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
