import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthService extends GetxService {
  final Logger logger;

  AuthService({required this.logger});

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.currentUser!.reload();
  }
}
