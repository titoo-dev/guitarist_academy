import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthService extends GetxService {
  final Logger logger;

  AuthService({required this.logger});

  @override
  void onInit() {
    super.onInit();
    if (FirebaseAuth.instance.currentUser != null) {
      logger.i('User is logged in');
      FirebaseAuth.instance.currentUser!.reload();
    } else {
      logger.i('User is not logged in');
    }
  }
}
