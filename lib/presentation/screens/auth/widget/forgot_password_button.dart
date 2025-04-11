import 'package:flutter/material.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style: AppTypography.h5.copyWith(
            color: AppColors.error,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
