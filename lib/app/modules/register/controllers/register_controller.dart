import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  void register() {
    Get.offNamed(Routes.ONBOARDING);
  }

  void navigateToLogin() {
    Get.offNamed(Routes.AUTH);
  }
}
