import 'package:flutter/material.dart';

extension CustomExtensions on Widget {
  Expanded asExpanded({int? flex}) => Expanded(flex: flex ?? 1, child: this);

  Padding padding(
          {double top = 0,
          double bottom = 0,
          double left = 0,
          double right = 0}) =>
      Padding(
        padding:
            EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
        child: this,
      );

  Padding vertPadding({required double val}) => Padding(
        padding: EdgeInsets.symmetric(vertical: val),
        child: this,
      );
}
