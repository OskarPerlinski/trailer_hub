import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:trailer_hub/core/di/di.dart';
import 'package:trailer_hub/core/geti_it/geti_it.dart';
import 'package:trailer_hub/firebase_options.dart';
import 'package:trailer_hub/presentation/router/app_router.dart';
import 'package:trailer_hub/presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependencies();
 runApp(HookedBlocConfigProvider(injector: () => getIt.get, child: const MyApp()));
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
