import 'package:flutter/material.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppbar({super.key, this.height, this.showBackButton = false});

  final double? height;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading:
          showBackButton
              ? IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.black),
                onPressed: () => Navigator.of(context).maybePop(),
              )
              : null,
      title: RichText(
        text: TextSpan(
          style: AppTypography.h2,
          children: [
            TextSpan(text: 'TRAILER', style: TextStyle(color: AppColors.black)),
            TextSpan(text: 'HUB', style: TextStyle(color: AppColors.primary)),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
