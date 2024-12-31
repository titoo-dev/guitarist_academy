import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicBrightness extends StatelessWidget {
  const DynamicBrightness(
      {super.key,
      required this.child,
      this.outsideSafeAreaColor = Colors.white});

  final Widget child;
  final Color outsideSafeAreaColor;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        setStatusBarIconBrightness(context, outsideSafeAreaColor);
        return Container(
          color: outsideSafeAreaColor,
          child: child,
        );
      },
    );
  }

  static void setStatusBarIconBrightness(
      BuildContext context, Color currentColor) {
    // Determine the brightness of the color outside the safe area // Replace with your color
    final Brightness brightness =
        ThemeData.estimateBrightnessForColor(currentColor);
    // Set the status bar icon brightness
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness:
          brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    ));
  }
}
