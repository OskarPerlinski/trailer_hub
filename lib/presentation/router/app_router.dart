import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trailer_hub/presentation/router/routes/app_rputes.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_up/sign_up.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.signUp,
    routes: $appRoutes,
  );
}

@TypedGoRoute<SignUpRoute>(path: AppRoutes.signUp)
class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}
