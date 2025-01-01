import 'package:get/get.dart';
import 'package:logger/logger.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Logger());
  }
}
