import 'package:flutter/material.dart';
import 'package:trailer_hub/core/di/di.dart';
import 'package:trailer_hub/presentation/router/app_router.dart';
import 'package:trailer_hub/presentation/theme/app_theme.dart';

void main() async {
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
    );
  }
}
