import 'package:flutter/material.dart';

import 'colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.text,
      required this.onPressed,
      this.icon,
      required this.darkMode,
      this.backgroundActive = false})
      : super(key: key);
  final String? text;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool backgroundActive;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundActive
                ? darkMode
                    ? Colours.backgroundWhite.withOpacity(0.1)
                    : Colours.black.withOpacity(0.1)
                : Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: onPressed,
        child: icon ??
            Text(
              text!,
              style: TextStyle(
                  color: darkMode ? Colours.backgroundWhite : Colours.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w400),
            ));
  }
}
