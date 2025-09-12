import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova/core/domain/utils/extensions.dart';
import 'package:nova/core/presentation/shared/styles/text_style.dart';



AppBar customAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    forceMaterialTransparency: true,
    titleSpacing: 0,
    leading: Icon(
      CupertinoIcons.back,
      color: context.colorScheme.onSecondary,
    ).onTap(onTap: () => context.pop()),
    title: TextRegular(title, fontSize: 18),
    centerTitle: false,
  );
}
