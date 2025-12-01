import 'package:animal_app/core/theming/app_colors.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor,
      this.textStyle,
      this.height,
      this.width,
      this.radius,
      this.verticalPadding,
      this.horizontalPadding});

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? radius;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryGreen,
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding?.h ?? 10.h,
            horizontal: horizontalPadding?.w ?? 10.w),
        minimumSize: Size(width?.w ?? double.infinity, height?.h ?? 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 8.r),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: textStyle ?? AppStyles.font14RegularWhite,
      ),
    );
  }
}
