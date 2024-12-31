import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  // current page
  final RxInt currentPage = 0.obs;

  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> onboardingItems;

  OnboardingController({required this.onboardingItems});

  // listen to page changes
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page!.round();
    });
  }

  void nextPage() {
    if (currentPage.value == onboardingItems.length - 1) {
      Get.offAllNamed(Routes.CHOOSE_AVATAR);
    }

    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    if (currentPage.value == 0) return;
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
