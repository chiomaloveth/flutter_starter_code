

import 'package:flutter/material.dart';
import 'package:nova/core/domain/exceptions/api_failure.dart';

extension ApiFailureExtension on ApiFailure {
  String toLocalizedErrorMessage(BuildContext context) {
    switch (this) {
      case UnauthorizedFailure():
        return 'Unauthorized access. Please log in to access this resource.';
      case ForbiddenFailure():
        return 'Forbidden access. You do not have permission to access this resource.';
      case NotFoundFailure():
        return 'The requested resource does not exist, has been removed, or is temporarily unavailable.';
      case BadRequestFailure():
        return 'Bad request. Please check your request and try again.';
      case ServerFailure():
        return 'An error occurred on the server. Please try again later.';
      case UnknownFailure():
        return 'An unknown error occurred. Please try again later.';
    }
  }
}

