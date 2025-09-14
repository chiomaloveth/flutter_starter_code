import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:nova/core/presentation/screens/splashOnboarding/splash_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static GoRouter routers = GoRouter(
    navigatorKey: _navigatorKey,
    observers: [RouteObserverService()],
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
      // GoRoute(
      //   path: OnboardingScreen.routeName,
      //   builder: (context, state) => OnboardingScreen(),
      // ),

      //Auth routes
      // GoRoute(
      //   path: RegisterEmailScreen.routeName,
      //   builder: (context, state) => RegisterEmailScreen(),
      // ),
      // GoRoute(
      //   path: RegisterConfirmationScreen.routeName,
      //   builder: (context, state) {
      //     final email = state.extra as String;
      //     return RegisterConfirmationScreen(email: email);
      //   },
      // ),
      // GoRoute(
      //   path: RegisterNameScreen.routeName,
      //   builder: (context, state) => const RegisterNameScreen(),
      // ),
      // GoRoute(
      //   path: RegisterPasswordScreen.routeName,
      //   builder: (context, state) => const RegisterPasswordScreen(),
      // ),
      // GoRoute(
      //   path: RegisterUsernameScreen.routeName,
      //   builder: (context, state) => const RegisterUsernameScreen(),
      // ),
      // GoRoute(
      //   path: LoginScreen.routeName,
      //   builder: (context, state) => const LoginScreen(),
      // ),

      // //Forgot password auth
      // GoRoute(
      //   path: ForgotPasswordEmailScreen.routeName,
      //   builder: (context, state) => const ForgotPasswordEmailScreen(),
      // ),
      // GoRoute(
      //   path: ForgotPasswordConfirmationScreen.routeName,
      //   builder: (context, state) {
      //     final email = state.extra as String;
      //     return ForgotPasswordConfirmationScreen(email: email);
      //   },
      // ),
      // GoRoute(
      //   path: ForgotPasswordResetPasswordScreen.routeName,
      //   builder: (context, state) => const ForgotPasswordResetPasswordScreen(),
      // ),

      // GoRoute(
      //   path: RegisterSuccessScreen.routeName,
      //   builder: (context, state) => const RegisterSuccessScreen(),
      // ),

      // //Network
      // GoRoute(
      //   path: BuildYourNetworkScreen.routeName,
      //   builder: (context, state) => const BuildYourNetworkScreen(),
      // ),

      // //Dashboard sscreen
      // GoRoute(
      //   path: DashboardScreen.routeName,
      //   builder: (context, state) => const DashboardScreen(),
      // ),
      // GoRoute(
      //   path: ReportScreen.routeName,
      //   builder: (context, state) => const ReportScreen(),
      // ),

      // //Explore
      // GoRoute(
      //   path: TrendingPostsScreen.routeName,
      //   builder: (context, state) {
      //     final model = state.extra as TrendingPostScreenModel;
      //     return TrendingPostsScreen(model: model);
      //   },
      // ),

      // //post
      // GoRoute(
      //   path: CreatePostScreen.routeName,
      //   builder: (context, state) => const CreatePostScreen(),
      // ),

      // //notifications
      // GoRoute(
      //   path: NotificationScreen.routeName,
      //   builder: (context, state) => const NotificationScreen(),
      // ),
      // GoRoute(
      //   path: ChatScreen.routeName,
      //   builder: (context, state) => ChatScreen(),
      // ),

      // //Profile
      // GoRoute(
      //   path: FollowingScreen.routeName,
      //   builder: (context, state) => FollowingScreen(),
      // ),
      // GoRoute(
      //   path: FollowersScreen.routeName,
      //   builder: (context, state) => FollowersScreen(),
      // ),
      // GoRoute(
      //   path: EditProfileScreen.routeName,
      //   builder: (context, state) => EditProfileScreen(),
      // ),
      // GoRoute(
      //   path: OthersProfileScreen.routeName,
      //   builder: (context, state) {
      //     final userId = state.extra as String;
      //     return OthersProfileScreen(userId: userId);
      //   },
      // ),
      // GoRoute(
      //   path: CounsellorsProfileScreen.routeName,
      //   builder: (context, state) => CounsellorsProfileScreen(),
      // ),
      // GoRoute(
      //   path: TherapistProfileScreen.routeName,
      //   builder: (context, state) => TherapistProfileScreen(),
      // ),
      // GoRoute(
      //   path: NotificationPrefrenceScreen.routeName,
      //   builder: (context, state) => NotificationPrefrenceScreen(),
      // ),
      // GoRoute(
      //   path: UpdatePasswordVerifyScreen.routeName,
      //   builder: (context, state) => UpdatePasswordVerifyScreen(),
      // ),
      // GoRoute(
      //   path: EnterNewPasswordScreen.routeName,
      //   builder: (context, state) => EnterNewPasswordScreen(),
      // ),

      // //Settings
      // GoRoute(
      //   path: OldEmailScreen.routeName,
      //   builder: (context, state) => OldEmailScreen(),
      // ),
      // GoRoute(
      //   path: PasswordScreen.routeName,
      //   builder: (context, state) {
      //     final title = state.extra as String;
      //     return PasswordScreen(title: title);
      //   },
      // ),
      // GoRoute(
      //   path: NewEmailScreen.routeName,
      //   builder: (context, state) => NewEmailScreen(),
      // ),
      // GoRoute(
      //   path: DeleteDeactivateAccountScreen.routeName,
      //   builder: (context, state) => DeleteDeactivateAccountScreen(),
      // ),
      // GoRoute(
      //   path: BlockedUsersListScreen.routeName,
      //   builder: (context, state) => const BlockedUsersListScreen(),
      // ),
      // GoRoute(
      //   path: ReportAProblemScreen.routeName,
      //   builder: (context, state) => const ReportAProblemScreen(),
      // ),
      // GoRoute(
      //   path: ContactSupportScreen.routeName,
      //   builder: (context, state) => const ContactSupportScreen(),
      // ),
    ],
  );
}

class RouteObserverService extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    Logger("").info('Navigated to: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    Logger("").info('Popped: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    Logger(
      "",
    ).info('Replaced: ${oldRoute?.settings.name} → ${newRoute?.settings.name}');
  }
}
