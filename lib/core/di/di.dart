import 'package:injectable/injectable.dart';
import 'package:trailer_hub/core/di/di.config.dart';
import 'package:trailer_hub/core/geti_it/geti_it.dart';

@injectableInit
Future<void> setupDependencies() async => getIt.init();