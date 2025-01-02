import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme.dart';

class EmailVerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // listen to user changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) return;
      if (user.emailVerified) {
        Get.offAllNamed(Routes.ONBOARDING);
      }
    });
  }

  // resend email
  void resendEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

    Get.snackbar(
      'Verification email sent',
      'Please verify your email address to continue.',
      duration: const Duration(seconds: 5),
      backgroundColor: colorScheme.primary,
    );
  }

  void continueToOnboarding() {
    Get.offAllNamed(Routes.ONBOARDING);
  }
}
