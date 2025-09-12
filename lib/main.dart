import 'dart:async';

import 'package:logging/logging.dart';

import 'app.dart';
import 'core/data/config/environment.dart';

Future<void> main() async {
  return runZonedGuarded(() async {
    await setUp(AppEnvironment.prod);
    await runNovaApp();
  }, (error, stackTrace) => Logger.root.severe('Uncaught error', error, stackTrace));
}
