import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/header_auth.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/login_button.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/password_field.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/widget/button/basic_button.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSpacings.xLarge(),
                HeaderAuth(
                  mainText: 'Sign Up',
                  secondText: 'Create account to continue!',
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.medium(),
                PasswordField(hintText: 'Password'),
                AppSpacings.medium(),
                PasswordField(hintText: 'Confirm password'),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Create Account'),
                AppSpacings.medium(),
                LoginButton(),
                AppSpacings.small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
