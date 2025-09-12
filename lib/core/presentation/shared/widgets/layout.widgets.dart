import 'package:flutter/material.dart';

class Col extends StatelessWidget {
  const Col({required this.children, this.mainAxisSize = MainAxisSize.max, super.key});
  final List<Widget> children;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: mainAxisSize, children: children);
  }
}

EdgeInsets pad({double both = 0, double? horizontal, double? vert}) =>
    EdgeInsets.symmetric(horizontal: horizontal ?? both, vertical: vert ?? both);

extension Space on num {
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  BorderRadiusGeometry get circular => BorderRadius.circular(toDouble());
}
