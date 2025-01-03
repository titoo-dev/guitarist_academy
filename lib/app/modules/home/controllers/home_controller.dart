import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  // selected category
  final selectedCategory = 'All'.obs;

  // current index
  final currentIndex = 0.obs;

  User get currentUser => FirebaseAuth.instance.currentUser!;

  // navigation key
  void onTap(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  // tap course
  void tapCourse() {
    Get.toNamed(Routes.COURSE_DETAIL);
  }

  // play module
  void tapModule() {
    Get.toNamed(Routes.LESSON_DETAIL);
  }

  void openSetting() {
    Get.toNamed(Routes.SETTING);
  }
}
