import 'package:animal_app/assets/assets.dart';
import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:animal_app/core/widgets/custom_button.dart';
import 'package:animal_app/features/signup/ui/widgets/already_have_account.dart';
import 'package:animal_app/features/signup/ui/widgets/signup_info_fields.dart';
import 'package:animal_app/features/signup/ui/widgets/upload_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(Assets.svgLogo),
                    verticalSpacing(25),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Sign Up",
                          style: AppStyles.font38RegularBlackOtama),
                    ),
                  ],
                ),
                verticalSpacing(25),
                SignupInfoFields(),
                verticalSpacing(10),
                UploadImageContainer(),
                verticalSpacing(20),
                CustomButton(onPressed: () {}, text: "Sign Up"),
                verticalSpacing(20),
                AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

