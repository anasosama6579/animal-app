import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasUppercase,
      required this.hasLowercase,
      required this.hasNumber,
      required this.hasSpecialCharacter,
      required this.hasMinLength,
      });

  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildValidationRow("At least 1 lowercase letter", hasLowercase),
        verticalSpacing(2),
        _buildValidationRow("At least 1 uppercase letter", hasUppercase),
        verticalSpacing(2),
        _buildValidationRow("At least 1 number", hasNumber),
        verticalSpacing(2),
        _buildValidationRow(
            "At least 1 special character", hasSpecialCharacter),
        verticalSpacing(2),
        _buildValidationRow("At least 8 characters long", hasMinLength),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: hasValidated ? Colors.green : Colors.red,
        ),
        horizontalSpacing(6),
        Text(text,
            style: hasValidated
                ? AppStyles.font10SemiBoldGreen.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.green,
                    decorationThickness: 2,
                  )
                : AppStyles.font10SemiBoldRed),
      ],
    );
  }
}
