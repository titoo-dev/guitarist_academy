import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    debugPrint('SplashController onInit');
    await Future.delayed(
      const Duration(seconds: 5),
      () => Get.offNamed(Routes.AUTH),
    );
  }
}
