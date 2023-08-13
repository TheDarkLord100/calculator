import 'package:flutter/material.dart';

import 'colors.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget(
    this.child, {
    Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        child: child,
        shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colours.gradientPink,
                  Colours.gradientOrange,
                ]).createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height)));
  }
}
