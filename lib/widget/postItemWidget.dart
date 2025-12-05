import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     children: [
          //       Icon(Icons.person, size: 50,color: AppColors.grey,),
          //       SizedBox(width: 10),
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               children: [
          //                 Text(
          //                   "Sophia Das",
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w700,
          //                     fontSize: 15,
          //                     color: Colors.white
          //                   ),
          //                 ),
          //                 SizedBox(width: 10),
          //                 Text(
          //                   "@Sophia_Das",
          //                   style: TextStyle(fontSize: 12, color: Colors.grey),
          //                 ),
          //               ],
          //             ),
          //             Text(
          //               "Poll : this or that?",
          //               style: TextStyle(fontSize: 14
          //               ,color: Colors.white),
          //             ),
          //           ],
          //         ),
          //       ),
          //       PopupMenuButton<String>(
          //         color: Colors.white,
          //         padding: EdgeInsets.zero,
          //         elevation: 8,
          //         menuPadding: EdgeInsets.zero,
          //         itemBuilder: (BuildContext context) =>
          //         [
          //           PopupMenuItem<String>(
          //             value: 'Unfollow',
          //
          //             child: Row(
          //               children: [
          //                 Icon(Icons.person),
          //                 SizedBox(width: 5),
          //                 Text('Unfollow'),
          //               ],
          //             ),
          //           ),
          //           PopupMenuItem<String>(
          //             value: 'mute-profile',
          //             child: Row(
          //               children: [
          //                 Icon(Icons.volume_mute),
          //                 SizedBox(width: 5),
          //                 Text('Mute profile'),
          //               ],
          //             ),
          //           ),
          //           PopupMenuItem<String>(
          //             value: 'report-post',
          //             child: Row(
          //               children: [
          //                 Icon(Icons.flag_outlined),
          //                 SizedBox(width: 5),
          //                 Text('Report post'),
          //               ],
          //             ),
          //           ),
          //         ],
          //         onSelected: (String selectedValue) {
          //           if (selectedValue == "Unfollow") {
          //             print("Unfollow");
          //           } else if (selectedValue == "mute-profile") {
          //             print("mute-profile");
          //           } else if (selectedValue == "report-post") {
          //             print("report-post");
          //           }
          //         },
          //         child: Icon(Icons.more_vert), // Optional: Custom button child
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Text(
          //     "#trendfood #trendfood",
          //     style: TextStyle(fontSize: 14, color: Colors.blueAccent),
          //   ),
          // ),
          // SizedBox(height: 10),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG3jTszSflQt-SjZGIWqJRegF0GrAVzpCQtg&s",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 10),

          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       border: Border.all(color: AppColors.grey),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Column(
          //         children: [
          //           Row(
          //             children: [
          //               Expanded(
          //                 child: Text(
          //                   "The author can see how you vote.",
          //                   style: TextStyle(color: AppColors.grey),
          //                 ),
          //               ),
          //               Text(
          //                 "1w left",
          //                 style: TextStyle(fontSize: 12, color: AppColors.grey),
          //               ),
          //             ],
          //           ),
          //           SizedBox(height: 10),
          //           ListView.builder(
          //             physics: NeverScrollableScrollPhysics(),
          //             itemCount: 3,
          //             shrinkWrap: true,
          //             itemBuilder: (context, index) {
          //               return GestureDetector(
          //                 onTap: () {},
          //                 child: Padding(
          //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //                   child: Container(
          //                     decoration: BoxDecoration(
          //                       gradient: LinearGradient(
          //                         colors: [
          //                           AppColors.appColor.withOpacity(0.4),
          //                           Colors.white,
          //                         ],
          //                         stops: [(index + 1) / 5, (index + 1) / 80],
          //                         begin: AlignmentGeometry.centerLeft,
          //                         end: AlignmentGeometry.centerRight,
          //                       ),
          //                       color: AppColors.appColor.withOpacity(0.8),
          //                       borderRadius: BorderRadius.circular(15),
          //                       border: Border.all(color: AppColors.grey),
          //                     ),
          //                     child: Padding(
          //                       padding: const EdgeInsets.symmetric(
          //                         vertical: 8.0,
          //                         horizontal: 20,
          //                       ),
          //                       child: Row(
          //                         children: [
          //                           Expanded(
          //                             child: Text(
          //                               "data ",
          //                               style: TextStyle(color: Colors.black),
          //                             ),
          //                           ),
          //                           Text(
          //                             ((((index + 1) / 5) * 100)
          //                                 .toInt()
          //                                 .toString()) +
          //                                 "%",
          //                             style: TextStyle(color: Colors.black),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               );
          //             },
          //           ),
          //           SizedBox(height: 10),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.message, color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Text("23", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.message, color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Text("23", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.message, color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Text("23", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.message, color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Text("23", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.message, color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Text("23", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
