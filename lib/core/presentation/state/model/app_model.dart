import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/app_user.dart';

part 'app_model.freezed.dart';

@freezed
class AppModel with _$AppModel {
  const factory AppModel({AppUser? user}) = _AppModel;
}
