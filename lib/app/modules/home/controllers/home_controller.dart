import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // current index
  final currentIndex = 0.obs;

  // navigation key
  static final navigatorKey = GlobalKey<NavigatorState>();

  void onTap(int index) {
    navigatorKey.currentState?.pushNamed('$index');
    currentIndex.value = index;
  }
}
