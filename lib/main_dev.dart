import 'dart:async';

import 'package:logging/logging.dart';
import 'core/data/config/environment.dart';

import 'app.dart';

Future<void> main() async {
  return runZonedGuarded(() async {
    await setUp(AppEnvironment.dev);
    await runNovaApp();
  }, (error, stackTrace) => Logger.root.severe('Uncaught error', error, stackTrace));
}
