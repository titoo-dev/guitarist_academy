import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  void login() {
    Get.offNamed(Routes.ONBOARDING);
  }

  void initiatePasswordRecovery() {
    Get.toNamed(Routes.RECOVER_PASSWORD);
  }

  void register() {
    Get.offNamed(Routes.REGISTER);
  }
}
