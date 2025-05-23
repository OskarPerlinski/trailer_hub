import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';
import 'package:trailer_hub/presentation/router/routes/app_routes.dart';
import 'package:trailer_hub/presentation/screens/auth/reset_password/reset_password.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_in/sign_in.dart';
import 'package:trailer_hub/presentation/screens/auth/sign_up/sign_up.dart';
import 'package:trailer_hub/presentation/screens/home/home_page.dart';
import 'package:trailer_hub/presentation/screens/movie_details/movie_details.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.signIn,
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

@TypedGoRoute<SignInRoute>(path: AppRoutes.signIn)
class SignInRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}

@TypedGoRoute<ResetPasswordRoute>(path: AppRoutes.resetPassword)
class ResetPasswordRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ResetPasswordPage();
  }
}

@TypedGoRoute<HomePageRoute>(path: AppRoutes.homePage)
class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<MovieDetailRoute>(path: AppRoutes.movieDetail)
class MovieDetailRoute extends GoRouteData {
  const MovieDetailRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final movieModel = state.extra as MovieModel;
    return MovieDetails(id: id, movieModel: movieModel);
  }
}
