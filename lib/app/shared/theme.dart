import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xff6073ef),
  primary: Color(0xff6073ef),
  onPrimary: Colors.white,
  brightness: Brightness.light,
  primaryContainer: Color(0xFF475BD8),
  secondary: Color(0xFFEFBA60),
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xFFD8A547),
  surface: Color(0xFFF6F7FF),
  onSurface: Color(0xFF000000),
  error: Color(0xFFB00020),
  onError: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xffeff1fe),
  onSecondaryContainer: Color(0xfffdf7e6),
);

const kOnPrimaryContainer = Color(0xffeff1fe);

const kSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  systemNavigationBarIconBrightness: Brightness.dark,
);

final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.grey[200],
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: colorScheme.onPrimary,
    padding: EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: colorScheme.primary,
  ),
);

// Gnav theme
final gNavRippleColor = Colors.grey[300];
final gNavHoverColor = Colors.grey[100];
final gNavActiveColor = Colors.black;
final gNavTabBackgroundColor = Colors.grey[100];
