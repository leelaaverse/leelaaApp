import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/utils/helper.dart';

import '../../auth/screen/login_screen.dart';
import '../manage/bloc/dashboard_bloc.dart';
import '../manage/event/dashboard_event.dart';
import '../manage/state/dashboard_state.dart';

class AppDrawer extends StatelessWidget with Helper {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) async {
          final bloc = context.read<DashboardBloc>();
          if (state.clickCall == "LogoutDrawerClick") {
            Scaffold.of(context).closeDrawer();
            showYesNoPopUp(
              msg: "Are you sure you want to logout?",
              title: "Logout",
              onYesPress: () {
                callNextAndClearStack(LoginScreen());
              },
            );
          }
          await EventCallHandler(state).navigationCalls(context, bloc);
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            final bloc = context.read<DashboardBloc>();
            return Drawer(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Container(
                width: 260,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Benjamin Lee",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "@BenjaminLee2345",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Post  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "40 ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Following  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,

                                  ),
                                ),
                                Text(
                                  "122",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Follower",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "122",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),

                      /// --- Menu Items ---
                      _DrawerItem(
                        icon: Icons.person,
                        title: "Profile",
                        onTap: () => bloc.add(ProfileDrawerClick()),
                      ),
                      _DrawerItem(
                        icon: Icons.notifications,
                        title: "Notifications",
                        onTap: () => bloc.add(NotificationDrawerClick()),
                      ),
                      _DrawerItem(
                        icon: Icons.settings,
                        title: "Setting & Privacy",
                        onTap: () => bloc.add(SettingDrawerClick()),
                      ),
                      _DrawerItem(
                        icon: Icons.file_copy,
                        title: "Terms & Policy",
                        onTap: () => bloc.add(TermsDrawerClick()),
                      ),
                      _DrawerItem(
                        icon: Icons.logout,
                        title: "Logout",
                        onTap: () => bloc.add(LogoutDrawerClick()),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(icon, size: 20, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 10,
      minLeadingWidth: 24,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
