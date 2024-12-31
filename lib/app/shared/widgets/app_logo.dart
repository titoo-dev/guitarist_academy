import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 50,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: size,
      child: Icon(
        LineIcons.guitar,
        color: Theme.of(context).primaryColor,
        size: size,
      ),
    );
  }
}
