import 'package:flutter/material.dart';

import 'colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.text,
      required this.onPressed,
      this.icon,
      this.backgroundActive = false})
      : super(key: key);
  final String? text;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool backgroundActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundActive
                ? Colours.black.withOpacity(0.1)
                : Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: onPressed,
        child: icon ??
            Text(
              text!,
              style: const TextStyle(
                  color: Colours.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w400),
            ));
  }
}
