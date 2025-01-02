import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme.dart';

class Snackbars {
  static void showInfoSnackbar(String title, String message) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 5),
      backgroundColor: Get.theme.colorScheme.primary,
      forwardAnimationCurve: Curves.easeInOut,
    ));
  }

  static void showErrorSnackbar(String errorMessage) {
    Get.showSnackbar(GetSnackBar(
      title: 'Error',
      message: errorMessage,
      duration: const Duration(seconds: 5),
      backgroundColor: kErrorColor,
      forwardAnimationCurve: Curves.easeInOut,
    ));
  }
}
