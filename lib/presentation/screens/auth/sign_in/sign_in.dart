import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:trailer_hub/presentation/assets/app_assets.dart';
import 'package:trailer_hub/presentation/router/routes/app_rputes.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_in/cubit/sign_in_action.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_in/cubit/sign_in_state.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/other_options_to_login.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/create_account_button.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/forgot_password_button.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/header_auth.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/password_field.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/socials_button.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';
import 'package:trailer_hub/presentation/widget/button/basic_button.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SignInCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener<SignInAction>(cubit, (action) {
      switch (action) {
        case SignInSuccess():
          context.go(AppRoutes.homePage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login successfully.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case SignInShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        case SignInHideLoading():
          Navigator.of(context).pop();
        case SignInShowErrorMessage(:final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.error,
            ),
          );
      }
    });

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: Durations.medium2,
        child: switch (state) {
          SignInInitial(:final errorMessage) => Padding(
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
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        error: errorMessage != null ? SizedBox.shrink() : null,
                      ),
                      controller: emailController,
                    ),
                    AppSpacings.medium(),
                    PasswordField(
                      hintText: 'Password',
                      controller: passwordController,
                      hasError: errorMessage != null,
                    ),
                    AppSpacings.small(),
                    ForgotPasswordButton(),
                    const AppSpacings.medium(),
                    if (errorMessage != null)
                      Text(
                        errorMessage,
                        style: TextStyle(color: AppColors.error),
                      ),
                    const AppSpacings.medium(),
                    BasicButton(
                      onPressed: () {
                        cubit.signInWithEmail(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      text: 'Login to acount',
                    ),
                    AppSpacings.medium(),
                    CreateAccountButton(),
                    AppSpacings.xLarge(),
                    OtherOptionsToLogin(),
                    AppSpacings.xLarge(),
                    SocialsButton(
                      text: 'Sign in with Google',
                      assetName: AppAssets.googleIcon,
                      onPressed: cubit.loginWithGoogle,
                    ),
                    AppSpacings.small(),
                  ],
                ),
              ),
            ),
          ),
          _ => Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}
