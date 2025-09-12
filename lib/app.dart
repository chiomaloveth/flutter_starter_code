import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:nova/core/data/config/environment.dart';
import 'package:nova/core/presentation/shared/widgets/app_banner.dart';

import 'package:nova/core/presentation/themes/theme_data.dart';
import 'package:nova/injectable.dart';



final AppBannerController appBannerController = AppBannerController();

Future<void> setUp(AppEnvironment env) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(name: kIsWeb ? null : env.name, options: env.firebaseOptions);

  _setupLogger(env);

  Logger.root.info('Running in $env');

  if (env != AppEnvironment.dev) {
    ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await configureDependencies(env);
}

void _setupLogger(AppEnvironment env) {
  Logger.root.level = env == AppEnvironment.prod ? Level.WARNING : Level.FINE;
  Logger.root.onRecord.listen((LogRecord rec) async {
    if (rec.error == null && rec.stackTrace == null) {
      debugPrint('[${rec.loggerName}] ${rec.level.name}: ${rec.time}: ${rec.message}');
    } else {
      debugPrint(
        '[${rec.loggerName}] ${rec.level.name}: ${rec.time}: '
        '${rec.message}\n${rec.error}\n${rec.stackTrace}',
      );
    }

    if (!kReleaseMode && !kProfileMode) {
      return;
    }
  });
}

Future<void> runNovaApp() async {
  runApp(
    MultiBlocProvider(providers: const [
      //BlocProvider.value(value: getIt<AppBloc>())
      ], child: const NovaApp()),
  );
    

}

class NovaApp extends StatefulWidget {
  const NovaApp({super.key});

  @override
  State<NovaApp> createState() => _NovaAppState();
}

class _NovaAppState extends State<NovaApp> with WidgetsBindingObserver {


  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
      
    });

  }

  @override
  Widget build(BuildContext context) {
    

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: 

             MaterialApp.router(
              debugShowCheckedModeBanner: false,
              //routerConfig: AppRouter.goRouter,
              
              theme: AppThemeData.lightTheme(),
              //darkTheme: themeController.darkTheme,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              builder:
                  (context, child) => Overlay(
                    initialEntries: [
                      OverlayEntry(
                        builder: (context) {
                          return Builder(
                            builder:
                                (context) => MediaQuery(
                                  data: MediaQuery.of(context),
                                  child: AppBannerView(controller: appBannerController, child: child!),
                                ),
                          );
                        },
                      ),
                    ],
                  ),
            )
    );
  }
}
