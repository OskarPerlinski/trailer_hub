import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.assetName});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName, height: AppDimens.l, width: AppDimens.l);
  }
}
