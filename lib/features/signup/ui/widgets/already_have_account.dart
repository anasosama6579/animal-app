import 'package:animal_app/core/helpers/extensions.dart';
import 'package:animal_app/core/routing/routes.dart';
import 'package:animal_app/core/theming/app_colors.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Have an account already? ",
              style: AppStyles.font14MediumGray,
            ),
            TextSpan(
              text: "Log In",
              recognizer: TapGestureRecognizer()..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
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

