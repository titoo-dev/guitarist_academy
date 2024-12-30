import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(kSystemUiOverlayStyle);

  runApp(
    GetMaterialApp(
      title: 'Guitarist Academy',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonTheme,
      ),
    ),
  );
}
