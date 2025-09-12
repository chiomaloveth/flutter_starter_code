import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

@lazySingleton
class GeneralUtility {
  // static GeneralUtility i = GeneralUtility._();
  // GeneralUtility._();

  Future<void> callPhoneNumber(String phoneNumber) {
    final phoneLink = 'tel:$phoneNumber';
    return openUrl(phoneLink);
  }

  Future<void> openEmail(String email) {
    final phoneLink = 'mailto:$email';
    return openUrl(phoneLink);
  }

  Future<void> openUrl(String url, [LaunchMode mode = LaunchMode.externalApplication]) async {
    launchUrl(Uri.parse(url), mode: mode);
  }

  int diffInDays(DateTime startDate, DateTime endDate) {
    final Duration dif = endDate.difference(startDate);

    return dif.inSeconds;
  }

  void offKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return;
    }
    currentFocus.unfocus();
  }

  String? formatDateWithSuffix(DateTime? date) {
    if (date == null) return null;
    final day = date.day;
    final suffix = getDaySuffix(day);
    final formattedDate = DateFormat('d MMMM, yyyy').format(date);
    return formattedDate.replaceFirst(day.toString(), '$day$suffix');
  }

  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String? convertToMonthYear(String? input) {
    if (input == null) return null;
    // Parse the string to a DateTime object
    DateTime dateTime = DateTime.parse('$input-01');

    // Format the DateTime object to 'MMMM, yyyy'
    String formattedDate = DateFormat('MMMM, yyyy').format(dateTime);

    return formattedDate;
  }
}
