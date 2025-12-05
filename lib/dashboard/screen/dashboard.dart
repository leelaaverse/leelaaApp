import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/constants/app_colors.dart';
import '../../constants/images.dart';
import '../../utils/helper.dart';
import '../manage/bloc/dashboard_bloc.dart';
import '../manage/event/dashboard_event.dart';
import '../manage/state/dashboard_state.dart';
import 'drawer.dart';

class Dashboard extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      DashboardBloc()
        ..add(GetInitialData()),
      child: Scaffold(
        drawer: AppDrawer(),

        // floatingActionButton: FloatingActionButton(
        //
        //   onPressed: () {
        //     callNextScreen(CreatePollScreen());
        //   },
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        //   child: Icon(Icons.add,color: Colors.white,),
        //   backgroundColor: AppColors.appColor,
        // ),
        body: BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) async {
            final bloc = context.read<DashboardBloc>();

            await EventCallHandler(state).navigationCalls(context, bloc);
          },
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              final bloc = context.read<DashboardBloc>();
              return Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .padding
                      .top + 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => bloc.add(DrawerOpenClick()),
                            child: Image.asset(
                              menu_icon,
                              height: 30,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              (state.image ?? "").isEmpty
                                  ? GestureDetector(
                                onTap: () =>
                                    bloc.add(ProfileDrawerClick()),
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  child: Image.asset(
                                    profile_icon,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                                  : GestureDetector(
                                onTap: () =>
                                    bloc.add(ProfileDrawerClick()),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    state.image,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.notifications,
                                size: 34,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            state.bottomIndex == 0
                                ? Text("Home")
                                : state.bottomIndex == 1
                                ? Text("Explore")
                                : state.bottomIndex == 2
                                ? Text("Community")
                                : Text("Reels"),
                          ],
                        ),
                      ),
                    ),

                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.secondaryAppColor,
                                  AppColors.appColor,
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => bloc.add(HomeClick()),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.home,
                                              color: state.bottomIndex == 0
                                                  ? Colors.white
                                                  : Colors.white60,
                                            ),
                                            Text(
                                              "Home",
                                              style: TextStyle(
                                                color: state.bottomIndex == 0
                                                    ? Colors.white
                                                    : Colors.white60,
                                                fontWeight: state.bottomIndex ==
                                                    0
                                                    ? FontWeight.w700
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => bloc.add(ExploreClick()),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: state.bottomIndex == 1
                                                ? Colors.white
                                                : Colors.white60,
                                          ),
                                          Text(
                                            "Explore",
                                            style: TextStyle(
                                              color: state.bottomIndex == 1
                                                  ? Colors.white
                                                  : Colors.white60,
                                              fontWeight: state.bottomIndex == 1
                                                  ? FontWeight.w700
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),

                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => bloc.add(CommunityClick()),
                                      child: Column(
                                        children: [
                                          Icon(Icons.map,
                                            color: state.bottomIndex == 2
                                                ? Colors.white
                                                : Colors.white60,),
                                          Text(
                                            "Community",
                                            style: TextStyle(
                                              color: state.bottomIndex == 2
                                                  ? Colors.white
                                                  : Colors.white60,
                                              fontWeight: state.bottomIndex == 2
                                                  ? FontWeight.w700
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => bloc.add(ReelsClick()),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.movie_filter_outlined,
                                            color: state.bottomIndex == 3
                                                ? Colors.white
                                                : Colors.white60,
                                          ),
                                          Text(
                                            "Reels",
                                            style: TextStyle(
                                              color: state.bottomIndex == 3
                                                  ? Colors.white
                                                  : Colors.white60,
                                              fontWeight: state.bottomIndex == 3
                                                  ? FontWeight.w700
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => bloc.add(GenerateNewClick()),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white, width: 1),
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 14.0,
                                horizontal: 35,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
