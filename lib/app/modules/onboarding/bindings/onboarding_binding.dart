import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  final List<Widget> onboardingItems;

  OnboardingBinding({required this.onboardingItems});

  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(onboardingItems: onboardingItems),
    );
  }
}
