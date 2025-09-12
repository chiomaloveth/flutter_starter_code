import 'dart:math';

import 'package:flutter/material.dart';

class WidthConstraint extends StatelessWidget {
  const WidthConstraint({required Widget child, Key? key}) : this._(child: child, width: defaultWidth, key: key);

  const WidthConstraint._({required this.child, required double width, super.key}) : _width = width;

  const WidthConstraint.tight({required Widget child, Key? key}) : this._(child: child, width: minWidth, key: key);

  static const double defaultWidth = 500;
  static const double minWidth = 400;

  final Widget child;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: min(_width, MediaQuery.of(context).size.width), child: child));
  }
}
