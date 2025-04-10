// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';

class AppSpacings extends SizedBox {
  const AppSpacings.small() : super(height: AppDimens.s);
  const AppSpacings.medium() : super(height: AppDimens.m);
  const AppSpacings.large() : super(height: AppDimens.l);
  const AppSpacings.xLarge() : super(height: AppDimens.xxl);
}