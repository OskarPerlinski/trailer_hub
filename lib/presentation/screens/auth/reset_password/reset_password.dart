import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/header_auth.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/widget/button/basic_button.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSpacings.small(),
                HeaderAuth(
                  mainText: 'Reset Password',
                  secondText: 'Enter your email below.',
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Send email'),
                AppSpacings.small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
