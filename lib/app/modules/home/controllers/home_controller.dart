import 'package:get/get.dart';

class HomeController extends GetxController {
  // selected category
  final selectedCategory = 'All'.obs;

  // current index
  final currentIndex = 0.obs;

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
    Get.toNamed('/course');
  }
}
