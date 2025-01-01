import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'app/modules/auth/services/auth_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Logger());

    Get.put(AuthService(logger: Get.find()));
  }
}
