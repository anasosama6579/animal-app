import 'package:animal_app/core/helpers/app_regex.dart';
import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:animal_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailAndPasswordFields extends StatefulWidget {
  const EmailAndPasswordFields({super.key});

  @override
  State<EmailAndPasswordFields> createState() => _EmailAndPasswordFieldsState();
}

class _EmailAndPasswordFieldsState extends State<EmailAndPasswordFields> {
  bool isObscure = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;
  // late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    //? Initialize passwordController here from Cubit
    //? setupPasswordListener();
    //setState(() {
    // hasLowercase = AppRegex.hasLowercase(password);
    // hasUppercase = AppRegex.hasUppercase(password);
    // hasNumber = AppRegex.hasNumber(password);
    // hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
    // hasMinLength = AppRegex.hasMinLength(password);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //? Add form key here from Cubit
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email", style: AppStyles.font16RegularDarkGray),
          verticalSpacing(8),
          AppTextFormField(
            hintText: "Enter your email address",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a your email';
              } else if (!AppRegex.isValidEmail(value)) {
                return 'Please enter a valid email address';
              }
            },
          ),
          verticalSpacing(20),
          Text("Password", style: AppStyles.font16RegularDarkGray),
          verticalSpacing(8),
          AppTextFormField(
              hintText: "Enter your password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
              ),
              isObscureText: isObscure,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (!AppRegex.isValidPassword(value)) {
                  return 'Password is not strong enough';
                }
              }),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
