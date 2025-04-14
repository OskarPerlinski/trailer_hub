import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:trailer_hub/presentation/router/routes/app_rputes.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_up/cubit/sign_up_action.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_up/cubit/sign_up_state.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/header_auth.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/login_button.dart';
import 'package:trailer_hub/presentation/screens/auth/widget/password_field.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';
import 'package:trailer_hub/presentation/widget/button/basic_button.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SignUpCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener<SignUpAction>(cubit, (action) {
      switch (action) {
        case SignUpSuccess():
          context.go(AppRoutes.homePage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Registered successfully.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case SignUpShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        case SignUpHideLoading():
          Navigator.of(context).pop();
        case SignUpShowErrorMessage(:final message):
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
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: Durations.medium2,
        child: switch (state) {
          SignUpInitial(:final errorMessage) => Padding(
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
                    AppSpacings.medium(),
                    PasswordField(
                      hintText: 'Confirm password',
                      controller: confirmPasswordController,
                      hasError: errorMessage != null,
                    ),
                    const AppSpacings.medium(),
                    if (errorMessage != null)
                      Text(
                        errorMessage,
                        style: TextStyle(color: AppColors.error),
                      ),
                    const AppSpacings.medium(),
                    BasicButton(
                      onPressed: () {
                        cubit.signUpWithEmail(
                          emailController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                        );
                      },
                      text: 'Create Account',
                    ),
                    AppSpacings.medium(),
                    LoginButton(),
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
