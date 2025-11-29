import 'package:flutter/material.dart';
import 'package:leelaah/widget/custom_outline_btn.dart';

import '../constants/app_colors.dart';
import 'custom_btn.dart';

class FollowerFollowingWidget extends StatelessWidget {
  var forFollowers = false;

  FollowerFollowingWidget(this.forFollowers, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 25),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sophia Das",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text("@Sophia_Das", style: TextStyle(fontSize: 10)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: !forFollowers ? CustomOutlineBtn(
              label: "Following",
              color: AppColors.black,
              labelColor: Colors.black,
              btnWidth: 80,
              radius: 6,
              paddingVertical: 6,
              textSize: 12,
              onPressed: () {
                print("sd");
              },
            ) : CustomButton(
              label: "Follow",
              color: AppColors.black,
              labelColor: Colors.white,
              btnWidth: 80,
              paddingVertical: 8,
              paddingHorizontal: 2,
              textSize: 12,
              onPressed: () {
                print("sd");
              },
            ),
          ),
        ],
      ),
    );
  }
}
