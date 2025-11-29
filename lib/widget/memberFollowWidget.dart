import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_btn.dart';

class MemberFollowWidget extends StatelessWidget {
  const MemberFollowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Icon(Icons.person, size: 50),
                Text(
                  "Sophia Das",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "@Sophia_Das",
                  style: TextStyle(fontSize: 10),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: CustomButton(
                    label: "Follow",
                    color: AppColors.black,
                    labelColor: Colors.white,
                    btnWidth: 80,
                    paddingVertical: 6,
                    paddingHorizontal: 2,
                    textSize: 12,
                    onPressed: () {
                      print("sd");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}