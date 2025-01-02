import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/snackbars.dart';
import '../../../shared/theme.dart';

class RegisterController extends GetxController {
  final Logger logger;

  RegisterController({required this.logger});

  final formKey = GlobalKey<FormBuilderState>();

  void checkFormValidity() {
    if (formKey.currentState!.saveAndValidate()) {
      final name = formKey.currentState!.fields['name']!.value as String;
      final email = formKey.currentState!.fields['email']!.value as String;
      final password =
          formKey.currentState!.fields['password']!.value as String;
      final confirmPassword =
          formKey.currentState!.fields['confirm_password']!.value as String;

      if (password != confirmPassword) {
        formKey.currentState!.fields['confirm_password']!
            .invalidate('Passwords do not match');
      } else {
        signUpWithEmailAndPassword(name, email, password);
      }
    }
  }

  // sign up with email and password
  Future<void> signUpWithEmailAndPassword(
      String name, String email, String password) async {
    showLoadingDialog();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // save display name
      await userCredential.user!.updateDisplayName(name);

      // send email verification
      await userCredential.user!.sendEmailVerification();

      // User is successfully created
      logger.i('Verification email sent.');

      closeLoadingDialog();

      Get.offNamed(Routes.EMAIL_VERIFICATION);

      Snackbars.showInfoSnackbar(
        'Verification email sent',
        'Please verify your email address to continue.',
      );
    } on FirebaseAuthException catch (e) {
      handleAuthError(e);
    } catch (e) {
      logger.e(e.toString());
      closeLoadingDialog();
    }
  }

  // show loading Diaglog
  void showLoadingDialog() {
    Get.dialog(
      Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SpinKitFadingCircle(
              size: 60.0,
              itemBuilder: (context, index) => DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? kOnPrimaryContainer : kWarningColor,
                ),
              ),
            ),
          ),
        ),
      ),
      barrierColor: kOnPrimaryContainer.withValues(alpha: 0.3),
      barrierDismissible: false,
    );
  }

  void closeLoadingDialog() {
    Get.back();
  }

  void register() {
    Get.offNamed(Routes.ONBOARDING);
  }

  void navigateToLogin() {
    Get.offNamed(Routes.AUTH);
  }

  void handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        logger.w('The password provided is too weak.');
        break;
      case 'email-already-in-use':
        logger.w('The account already exists for that email.');
        break;
      default:
        logger.w('Authentication error: ${e.message}');
    }
  }
}
