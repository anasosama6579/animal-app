import 'package:animal_app/core/helpers/extensions.dart';
import 'package:animal_app/core/routing/routes.dart';
import 'package:animal_app/core/theming/app_colors.dart';
import 'package:animal_app/core/theming/app_styles.dart';
import 'package:animal_app/features/signup/logic/signup/signup_cubit.dart';
import 'package:animal_app/features/signup/logic/signup/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupBlocListener  extends StatelessWidget {
  const SignupBlocListener ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      // listenWhen: (previous, current) => current is Loading || current is Failure || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryGreen,
                ),
              ),
            );
          },
          success: (signupResponse) {
            context.popDialog();
            context.pushReplacementNamed(Routes.homeScreen);
          },
          failure: (errorMessage) {
            context.popDialog();

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  errorMessage,
                  style: AppStyles.font14MediumGray,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "Got it",
                      style: AppStyles.font14MediumGray,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
