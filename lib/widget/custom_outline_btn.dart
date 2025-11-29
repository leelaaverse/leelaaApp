import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomOutlineBtn extends StatelessWidget {
  final String label;
  final String? image;
  final void Function()? onPressed;
  final Color color;
  final Color labelColor;
  final double elevation;
  final BorderRadiusGeometry? borderRadius;
  final double paddingVertical;
  final double textSize;
  final double radius;
  final double btnWidth;
  final double paddingHorizontal;

  const CustomOutlineBtn({
    Key? key,
    required this.label,
    this.image,
    this.onPressed,
    this.btnWidth = double.infinity,
    this.paddingHorizontal = 0,
    this.color = AppColors.appColor,
    this.labelColor = AppColors.black,
    this.elevation = 0.0,
    this.borderRadius,
    this.textSize = 16.0,
    this.paddingVertical = 10.0,
    this.radius = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1.1,
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: btnWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: color),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: paddingVertical, horizontal: paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (image ?? "").isNotEmpty
                    ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      image ?? "",
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
                    : Container(),
                Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontWeight: FontWeight.w600,
                    fontSize: textSize,
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
