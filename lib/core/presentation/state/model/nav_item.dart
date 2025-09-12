import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nav_item.freezed.dart';

@freezed
class NavItem with _$NavItem {
  const factory NavItem({
    @Default('') String title,
    @Default('') String subTitle,
    @Default('') String content,
    @Default('') String imagePath,
    @Default('') String unselectedImgPath,
    @Default('') String selectedIconPath,
    @Default('') String tracked,
    @Default('') String target,
    @Default(WidgetPlaceholder()) Widget body,
    @Default(WidgetPlaceholder()) Widget unselectedIcon,
    @Default(WidgetPlaceholder()) Widget selectedIcon,
    @Default(WidgetPlaceholder()) Widget leadingIcon,
    void Function()? onTap,
    @Default(false) bool hideIcon,
    @Default(false) bool isSelected,
    Color? color,
    dynamic key,
    int? id,
    dynamic data,
    dynamic value,
  }) = _NavItem;
}

class WidgetPlaceholder extends StatelessWidget {
  const WidgetPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
