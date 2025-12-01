import 'package:animal_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password...?",
          style: AppStyles.font10SemiBoldPrimaryGreen.copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
          )
        ),
      ),
    );
  }
}
