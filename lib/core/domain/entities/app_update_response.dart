import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_response.freezed.dart';

@freezed
class AppUpdateResponse with _$AppUpdateResponse {
  const factory AppUpdateResponse({
    required String updateUrl,
    required String version,
    required int buildNumber,
    required bool forceUpdate,
    required bool canUpdate,
  }) = _AppUpdateResponse;
}
