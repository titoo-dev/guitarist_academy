import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme.dart';

class AuthController extends GetxController {
  final Logger logger;

  AuthController({required this.logger});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          logger.i('User is signed in: ${user.email}');

          Get.showSnackbar(GetSnackBar(
            title: 'Welcome back',
            message: 'You are signed in as ${user.email}',
            duration: const Duration(seconds: 5),
            backgroundColor: Get.theme.colorScheme.primary,
            forwardAnimationCurve: Curves.easeInOut,
          ));
        } else {
          logger.i('User is signed out.');

          Get.showSnackbar(GetSnackBar(
            title: 'Signed out',
            message: 'You are signed out.',
            duration: const Duration(seconds: 5),
            backgroundColor: kWarningColor,
            forwardAnimationCurve: Curves.easeInOut,
          ));
        }
      },
      onError: (e) {
        logger.e(e.toString());

        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: e.toString(),
          duration: const Duration(seconds: 5),
          forwardAnimationCurve: Curves.easeInOut,
        ));
      },
    );
  }

  void checkFormValidity() {
    if (formKey.currentState!.saveAndValidate()) {
      final email = formKey.currentState!.fields['email']!.value as String;
      final password =
          formKey.currentState!.fields['password']!.value as String;

      signInWithEmailAndPassword(email, password);
    }
  }

  void login() {
    Get.offNamed(Routes.ONBOARDING);
  }

  void initiatePasswordRecovery() {
    Get.toNamed(Routes.RECOVER_PASSWORD);
  }

  void register() {
    Get.offNamed(Routes.REGISTER);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    showLoadingDialog();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // User is successfully signed in
      logger.i('User signed in: ${userCredential.user}');

      closeLoadingDialog();

      Get.showSnackbar(GetSnackBar(
        title: 'Welcome back',
        message: 'You are signed in as ${userCredential.user!.email}',
        duration: const Duration(seconds: 5),
        backgroundColor: Get.theme.colorScheme.primary,
        forwardAnimationCurve: Curves.easeInOut,
      ));
    } on FirebaseAuthException catch (e) {
      closeLoadingDialog();
      handleAuthError(e);

      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e.message,
        duration: const Duration(seconds: 5),
        backgroundColor: kErrorColor,
        forwardAnimationCurve: Curves.easeInOut,
      ));
    } catch (e) {
      closeLoadingDialog();
      logger.e(e.toString());

      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e.toString(),
        duration: const Duration(seconds: 5),
        backgroundColor: kErrorColor,
        forwardAnimationCurve: Curves.easeInOut,
      ));
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

  void handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        logger.w('No user found for that email.');
        break;
      case 'wrong-password':
        logger.w('Wrong password provided for that user.');
        break;
      default:
        logger.w('Authentication error: ${e.message}');
    }
  }
}
