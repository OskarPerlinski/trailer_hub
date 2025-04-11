import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/create_account_button.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/forgot_password_button.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/header_auth.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/password_field.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/widget/button/basic_button.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

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
                  mainText: 'Sign In',
                  secondText: 'Welcome Back! Sign in to continue!',
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.medium(),
                PasswordField(hintText: 'Password'),
                AppSpacings.small(),
                ForgotPasswordButton(),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Login to acount'),
                AppSpacings.medium(),
                CreateAccountButton(),
                AppSpacings.small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
