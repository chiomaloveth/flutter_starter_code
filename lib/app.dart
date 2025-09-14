import 'dart:async';
import 'dart:io' show Platform;

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:go_router/go_router.dart';

import 'package:logging/logging.dart';
import 'package:nova/core/data/config/build_config.dart';
import 'package:nova/core/data/config/environment.dart';
import 'package:nova/core/presentation/navigation/routers.dart';
import 'package:nova/core/presentation/shared/widgets/app_banner.dart';
import 'package:nova/core/presentation/themes/theme_data.dart';
import 'package:nova/injectable.dart';

final AppBannerController appBannerController = AppBannerController();

Future<void> setUp(AppEnvironment env) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive

  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  _setupLogger(env);

  Logger.root.info('Running in $env');

  if (!BuildConfig.isDev) {
    ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await configureDependencies(env);
}

void _setupLogger(AppEnvironment env) {
  Logger.root.level = env == AppEnvironment.prod ? Level.WARNING : Level.FINE;
  Logger.root.onRecord.listen((LogRecord rec) async {
    if (rec.error == null && rec.stackTrace == null) {
      debugPrint(
        '[${rec.loggerName}] ${rec.level.name}: ${rec.time}: ${rec.message}',
      );
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
    MultiBlocProvider(
      providers: const [
        // BlocProvider.value(value: getIt<AppBloc>()),
        // BlocProvider.value(value: getIt<CreateAccountBloc>()),
        // BlocProvider.value(value: getIt<LogInBloc>()),
        // BlocProvider.value(value: getIt<GetConversationsBloc>()),
        // BlocProvider.value(value: getIt<ChatListBloc>()),
        // BlocProvider.value(value: getIt<ChatKeysBloc>()),
        // BlocProvider.value(value: getIt<TwoFactorAuthenticationBloc>()),
      ],
      child: const NovaApp(),
    ),
  );
}

class NovaApp extends StatefulWidget {
  const NovaApp({super.key});

  @override
  State<NovaApp> createState() => _NovaAppState();
}

class _NovaAppState extends State<NovaApp> with WidgetsBindingObserver {
  final refreshDebouncer = Debouncer<DateTime>(
    const Duration(hours: 1),
    initialValue: DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _requestAppTrackingPermission();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  void _requestAppTrackingPermission() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (Platform.isIOS) {
          final status =
              await AppTrackingTransparency.requestTrackingAuthorization();

          switch (status) {
            case TrackingStatus.authorized:
              debugPrint('App tracking authorized');
              // Initialize analytics/ads SDKs that require tracking
              break;
            case TrackingStatus.denied:
              debugPrint('App tracking denied');
              // Use alternative analytics without tracking
              break;
            case TrackingStatus.restricted:
              debugPrint('App tracking restricted');
              break;
            case TrackingStatus.notDetermined:
              debugPrint('App tracking not determined');
              break;
            case TrackingStatus.notSupported:
              debugPrint('App tracking not supported on this device');
              break;
          }
        } else if (Platform.isAndroid) {
          debugPrint('App tracking transparency not needed on Android');
          // On Android, you might want to request other permissions here
          // like notification permissions, etc.
        }
      } catch (e) {
        debugPrint('Error requesting app tracking permission: $e');
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      refreshDebouncer.value = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    //final themeController = ThemeController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      //child: ListenableBuilder(
      //listenable: themeController,
      // builder: (context, _) {
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routers,
        // themeMode: themeController.themeMode,
        theme: AppThemeData.lightTheme(),
        //darkTheme: themeController.darkTheme,
        builder: (context, routerChild) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) {
                  return MediaQuery(
                    data: MediaQuery.of(context),
                    child: AppBannerView(
                      controller: appBannerController,
                      child: routerChild!,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
