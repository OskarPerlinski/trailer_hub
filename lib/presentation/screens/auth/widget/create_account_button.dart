import 'package:flutter/material.dart';
import 'package:trailer_hub/presentation/router/app_router.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => SignUpRoute().go(context),
      child: RichText(
        text: TextSpan(
          text: 'Dont have an account? ',
          style: AppTypography.h5.copyWith(color: AppColors.secondary),
          children: [
            TextSpan(
              text: 'Sign Up',
              style: AppTypography.h5.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}