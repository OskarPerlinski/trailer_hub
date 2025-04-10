import 'package:flutter/material.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.mainText,
    required this.secondText,
  });

  final String mainText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mainText,
            style: AppTypography.h1.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          AppSpacings.small(),
          Text(
            secondText,
            style: AppTypography.h4.copyWith(color: AppColors.secondary),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
