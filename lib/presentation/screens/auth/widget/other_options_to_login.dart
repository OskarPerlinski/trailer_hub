import 'package:flutter/material.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';

class OtherOptionsToLogin extends StatelessWidget {
  const OtherOptionsToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.secondary)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.l),
              child: Text('or', style: TextStyle(color: AppColors.secondary)),
            ),
            Expanded(child: Divider(color: AppColors.secondary)),
          ],
        ),
      ],
    );
  }
}
