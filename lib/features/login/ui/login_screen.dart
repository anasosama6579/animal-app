import 'package:animal_app/assets/assets.dart';
import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_colors.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:animal_app/core/widgets/custom_button.dart';
import 'package:animal_app/features/login/ui/widgets/email_and_password_fields.dart';
import 'package:animal_app/features/login/ui/widgets/forget_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(Assets.svgLogo),
                  verticalSpacing(25),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Log In",
                        style: AppStyles.font38RegularBlackOtama),
                  ),
                ],
              ),
              verticalSpacing(25),
              EmailAndPasswordFields(),
              verticalSpacing(8),
              ForgetPasswordButton(),
              verticalSpacing(25),
              CustomButton(onPressed: (){}, text: "Log In"),
              Spacer(),
              DoNotHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}


class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: AppStyles.font14MediumGray,
            ),
            TextSpan(
              text: "Sign Up now",
              style: AppStyles.font14SemiBoldGreen.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryGreen,
                decorationThickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

