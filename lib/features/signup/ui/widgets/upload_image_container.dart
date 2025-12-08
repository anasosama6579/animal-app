import 'package:animal_app/assets/assets.dart';
import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_colors.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadImageContainer extends StatefulWidget {
  const UploadImageContainer(
      {super.key, required this.galleryOnTap, required this.cameraOnTap});

  final VoidCallback galleryOnTap;
  final VoidCallback cameraOnTap;

  @override
  State<UploadImageContainer> createState() => _UploadImageContainerState();
}

class _UploadImageContainerState extends State<UploadImageContainer> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: isPressed
              ? Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFD8D8D8),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: widget.galleryOnTap,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Text(
                                "Photo Gallery",
                                style: AppStyles.font18RegularGreenOtama,
                              ),
                            ),
                          ),
                          Divider(
                            color: AppColors.white.withValues(alpha: 0.8),
                            thickness: 0.4,
                          ),
                          GestureDetector(
                            onTap: widget.cameraOnTap,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Text(
                                "Camera",
                                style: AppStyles.font18RegularGreenOtama,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFD8D8D8),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Text(
                              "Cancel",
                              style: AppStyles.font18RegularGreenOtama,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: AppColors.primaryGreen,
                    dashPattern: const [2, 4],
                    radius: Radius.circular(10.r),
                  ),
                  child: SizedBox(
                    height: 200.h,
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
                ),
        ),
      ],
    );
  }
}
