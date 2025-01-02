import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'theme.dart';

class Dialogs {
  static void showLoadingDialog() {
    Get.dialog(
      Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SpinKitFadingCircle(
              size: 60.0,
              itemBuilder: (context, index) => DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? kOnPrimaryContainer : kWarningColor,
                ),
              ),
            ),
          ),
        ),
      ),
      barrierColor: kOnPrimaryContainer.withValues(alpha: 0.3),
      barrierDismissible: false,
    );
  }

  // confirmation dialog
  static void showConfirmationDialog({
    required String title,
    required String content,
    required Function onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Get.back();
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }

  static void closeCurrentDialog() {
    Get.back();
  }
}
