import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/profile/manage/state/user_profile_state.dart';
import 'package:leelaah/widget/custom_btn.dart';
import 'package:leelaah/widget/postItemWidget.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../utils/helper.dart';
import '../../widget/custom_outline_btn.dart';
import '../../widget/followerFollowingWidget.dart';
import '../manage/bloc/user_profile_bloc.dart';
import '../manage/event/user_profile_event.dart';

class UserProfileScreen extends StatelessWidget with Helper {
  var userFor = "";

  UserProfileScreen(this.userFor);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      UserProfileBloc()
        ..add(GetInitialData(userFor)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              final bloc = context.read<UserProfileBloc>();

              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.22,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                    back_profile
                                ), fit: BoxFit.cover),
                                // gradient: LinearGradient(
                                //   colors: [Colors.blueAccent, Colors.lightBlue],
                                // ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 40,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () => bloc.add(BackCall()),
                                        child: Icon(
                                          Icons.arrow_back_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.share, color: Colors.white),
                                      state.userFor != "otherProfile"
                                          ? Container()
                                          : Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: PopupMenuButton<String>(
                                          color: Colors.white,
                                          padding: EdgeInsets.zero,
                                          elevation: 8,
                                          menuPadding: EdgeInsets.zero,
                                          itemBuilder:
                                              (BuildContext context) =>
                                          [
                                            PopupMenuItem<String>(
                                              value: 'block',

                                              child: Row(
                                                children: [
                                                  Icon(Icons.block),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Block Profile',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'copy',
                                              child: Row(
                                                children: [
                                                  Icon(Icons.link),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Copy Profile Link',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'mute-profile',
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.volume_mute,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Mute profile',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'report-post',
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .flag_outlined,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text('Report post'),
                                                ],
                                              ),
                                            ),
                                          ],
                                          onSelected:
                                              (String selectedValue) {
                                            if (selectedValue ==
                                                "Unfollow") {
                                              print("Unfollow");
                                            } else if (selectedValue ==
                                                "mute-profile") {
                                              print("mute-profile");
                                            } else if (selectedValue ==
                                                "report-post") {
                                              print("report-post");
                                            }
                                          },
                                          child: Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 28,
                                          ), // Optional: Custom button child
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person, size: 50),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Container(
                                width: 120,
                                height: 35,

                                child: state.userFor == "otherProfile"
                                    ? CustomButton(
                                  paddingVertical: 4,
                                  label: "Follow",
                                  textSize: 14,
                                  color: AppColors.black,
                                  labelColor: AppColors.white,
                                  onPressed: () {},
                                )
                                    : CustomOutlineBtn(
                                  paddingVertical: 4,
                                  label: "Edit Profile",
                                  textSize: 14,

                                  color: AppColors.appColor,
                                  labelColor: AppColors.appColor,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Benjamin Lee",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            const Text(
                              "@BenjaminLee2345 · Fresno, CA",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Digital Goodies Team · Web & Mobile UI/UX Development · Graphics · Illustrations",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "112 Following · 15 Followers",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                  TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: "Posts"),
                      Tab(text: "Draft")
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        profilePostsWidget(),
                        profilePostsWidget(),
                        // followersScreenWidget(bloc),
                        // followingScreenWidget(bloc),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget profilePostsWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return PostItemWidget();
      },
    );
  }

  Widget followersScreenWidget(UserProfileBloc bloc) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => bloc.add(MemberClick("423")),
          child: FollowerFollowingWidget(true),
        );
      },
    );
  }

  Widget followingScreenWidget(UserProfileBloc bloc) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => bloc.add(MemberClick("423")),
          child: FollowerFollowingWidget(false),
        );
      },
    );
  }
}
