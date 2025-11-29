import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../utils/helper.dart';

class CustomAppBar extends StatelessWidget with Helper {
  const CustomAppBar({super.key, required this.title, this.leading});

  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      leading:
      leading ??
          GestureDetector(
            onTap: () {
              callBackScreen();
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
              size: 20,
            ),
          ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
