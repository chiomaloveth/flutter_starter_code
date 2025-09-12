import 'dart:async';

import 'package:intl_phone_field/phone_number.dart';

final RegExp emailRegex = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);

class AppValidations {
  const AppValidations._();

  static String? validatedEmail(String? value) {
    String? result;
    if (value != null) {
      if (value.trim().isEmpty) {
        result = "Email cannot be empty";
      } else if (!emailRegex.hasMatch(value)) {
        result = "Invalid email";
      }
    } else {
      result = null;
    }
    return result;
  }

  static String? validatePassword(String? password) {
    // Check if the password is null or empty
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    String pattern = r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).+$';
    RegExp regExp = RegExp(pattern);

    // Validate the password
    if (!regExp.hasMatch(password)) {
      return 'Password must contain at least \none capital letter and one special character';
    }

    // If everything is fine, return null (no error)
    return null;
  }

  static FutureOr<String?>? validatePhoneNumber(PhoneNumber? value) {
    String? result;
    if (value != null && value.number.isEmpty) {
      result = "Phone Number can't be empty";
    } else if (value != null && value.number.length < 10) {
      result = "Invalid Number";
    } else {
      result = null;
    }

    return result;
  }

  static String? validatedName(String? value, {String label = "Name"}) {
    String? result;
    if (value != null && value.trim().isEmpty) {
      result = "$label can't be empty";
    } else {
      result = null;
    }

    return result;
  }

  static String? validatedText(String? value, {String label = "Field"}) {
    String? result;
    if (value != null && value.trim().isEmpty) {
      result = "$label can't be empty";
    } else {
      result = null;
    }

    return result;
  }

  static String? validateOtp(String? value) {
    String? result;
    if (value != null && value.trim().isEmpty) {
      result = "OTP can't be empty";
    } else if (value != null && value.length != 6) {
      result = "Invalid OTP";
    } else {
      result = null;
    }

    return result;
  }

  // static String? validateAmount(String? value,
  //     {required double amount, String label = "Name"}) {
  //   String? result;
  //   if (value != null && value.trim().isEmpty) {
  //     result = "$label can't be empty";
  //     if (amount < double.parse(value)) {
  //       result = "Insufficient fund";
  //     }
  //   } else {
  //     result = null;
  //   }

  //   return result;
  // }
}
