import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:animal_app/core/widgets/app_text_form_field.dart';
import 'package:animal_app/core/widgets/password_validation.dart';
import 'package:flutter/material.dart';

class SignupInfoFields extends StatefulWidget {
  const SignupInfoFields({super.key});

  @override
  State<SignupInfoFields> createState() => _SignupInfoFieldsState();
}

class _SignupInfoFieldsState extends State<SignupInfoFields> {
  bool isObscure = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;
  bool isValidPassword = false;
  // late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    //? Initialize passwordController here from Cubit
    //? setupPasswordListener();
    //setState(() {
    // isValidPassword = AppRegex.isValidPassword(password);
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
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text("First Name", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              hintText: "Enter your First Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
              }),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Last Name", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              hintText: "Enter your Last Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
              }),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Email", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              hintText: "Enter your email address",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
              }),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Phone", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              hintText: "Enter your Phone Number",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
              }),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Password", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              hintText: "Enter your password",
              isObscureText: isObscure,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
              }),
          verticalSpacing(8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Please add all necessary characters ",
                style: isValidPassword
                    ? AppStyles.font10SemiBoldGreen
                    : AppStyles.font10SemiBoldRed),
          ),
          verticalSpacing(8),
          PasswordValidation(
            hasUppercase: hasUppercase,
            hasLowercase: hasLowercase,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasMinLength: hasMinLength,
          ),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Confirm Password",
                  style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              hintText: "Enter your password again",
              isObscureText: isObscure,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password again';
                }
              }),
        ],
      ),
    );
  }

  //! dispose passwordController if initialized

}
