import 'package:animal_app/core/helpers/app_regex.dart';
import 'package:animal_app/core/helpers/spacing.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:animal_app/core/widgets/app_text_form_field.dart';
import 'package:animal_app/core/widgets/password_validation.dart';
import 'package:animal_app/features/signup/logic/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    passwordController = context.read<SignupCubit>().password;
   setupPasswordListener();
  }

  void setupPasswordListener() {
    passwordController.addListener(() {
      final password = passwordController.text;

      setState(() {
        hasLowercase = AppRegex.hasLowercase(password);
        hasUppercase = AppRegex.hasUppercase(password);
        hasNumber = AppRegex.hasNumber(password);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text("First Name", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
            controller: context.read<SignupCubit>().firstName,
              hintText: "Enter your First Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              }),
          verticalSpacing(20),
          Align(

              alignment: Alignment.centerLeft,
              child: Text("Last Name", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              controller: context.read<SignupCubit>().lastName,

              hintText: "Enter your Last Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              }),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Email", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              controller: context.read<SignupCubit>().email,

              hintText: "Enter your email address",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }return null;
              }),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Phone", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              controller: context.read<SignupCubit>().phone,
              hintText: "Enter your Phone Number",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }return null;
              }),
          verticalSpacing(20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Password", style: AppStyles.font16RegularDarkGray)),
          verticalSpacing(8),
          AppTextFormField(
              controller: context.read<SignupCubit>().password,
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
                }return null;
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
              controller: context.read<SignupCubit>().confirmedPassword,

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
                }return null;
              }),
        ],
      ),
    );
  }

@override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

}
