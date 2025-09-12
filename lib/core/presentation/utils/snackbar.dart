

import 'package:flutter/material.dart';
import 'package:nova/app.dart';
import 'package:nova/core/presentation/shared/widgets/app_banner.dart';

void showErrorSnackbar(String message, {String? title, BuildContext? context, VoidCallback? onTap, int duration = 4}) {
  appBannerController.pushErrorBanner(
    message,
    context: context,
    onTap: onTap,
    title: title,
    timeout: TimedBannerRemovePolicy(Duration(seconds: duration)),
  );
}

void showSuccessSnackbar(String message, {String? title, BuildContext? context, VoidCallback? onTap}) {
  appBannerController.pushSuccessBanner(message, context: context, onTap: onTap, title: title);
}

void showInfoSnackbar(String message, {String? title, BuildContext? context, VoidCallback? onTap}) {
  appBannerController.pushInfoBanner(message, onTap: onTap, title: title);
}

void showWarningSnackbar(String message, {String? title, BuildContext? context, VoidCallback? onTap}) {
  appBannerController.pushWarningBanner(message, onTap: onTap, title: title);
}
