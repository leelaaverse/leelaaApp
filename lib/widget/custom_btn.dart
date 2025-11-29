import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final Color color;
  final Color labelColor;
  final Color iconColor;
  final double elevation;
  final BorderRadiusGeometry? borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double textSize;
  final double btnWidth;
  final double radius;

  const CustomButton({
    Key? key,
    required this.label,
    this.icon,
    this.onPressed,
    this.color = AppColors.appColor,
    this.labelColor = AppColors.white,
    this.iconColor = AppColors.white,
    this.elevation = 0.0,
    this.borderRadius,
    this.textSize = 15.0,
    this.btnWidth = double.infinity,
    this.paddingVertical = 10,
    this.paddingHorizontal = 24,
    this.radius = 6.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1.1,
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: btnWidth,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon != null ? Icon(icon, color: iconColor, size: 25) : null,
          label: Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.w600,
              fontSize: textSize,
            ),
          ),

          style: ElevatedButton.styleFrom(
            minimumSize: Size(0, 0),
            backgroundColor: color,
            elevation: elevation,
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
              vertical: paddingVertical,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(radius),
            ),
            shadowColor: AppColors.primary3,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
