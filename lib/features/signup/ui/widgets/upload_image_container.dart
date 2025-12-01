import 'package:animal_app/assets/assets.dart';
import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_colors.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadImageContainer extends StatelessWidget {
  const UploadImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: AppColors.primaryGreen,
        dashPattern: const [6, 4],
        radius: Radius.circular(10.r),
      ),
      child: SizedBox(
        height: 150.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SvgPicture.asset(Assets.svgSelectImage),
            verticalSpacing(16),
            Text(
              "Select Profile Image",
              style: AppStyles.font16MediumGreen,
            ),
          ],
        ),
      ),
    );
  }
}
