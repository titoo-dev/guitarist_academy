import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // selected category
  final selectedCategory = 'All'.obs;

  // current index
  final currentIndex = 0.obs;

  // navigation key
  static final navigatorKey = GlobalKey<NavigatorState>();

  void onTap(int index) {
    if (currentIndex.value == index) return;
    navigatorKey.currentState?.pushReplacementNamed('$index');
    currentIndex.value = index;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  // tap course
  void tapCourse() {
    Get.toNamed('/course');
  }
}
