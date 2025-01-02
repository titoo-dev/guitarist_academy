import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/dialogs.dart';
import '../../../shared/snackbars.dart';

class AuthController extends GetxController {
  final Logger logger;

  AuthController({required this.logger});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        logger.i('User is signed in: ${user.displayName}');
        Get.offAllNamed(Routes.HOME);
      }
    });
  }

  void checkFormValidity() {
    if (formKey.currentState!.saveAndValidate()) {
      final email = formKey.currentState!.fields['email']!.value as String;
      final password =
          formKey.currentState!.fields['password']!.value as String;

      signInWithEmailAndPassword(email, password);
    }
  }

  void initiatePasswordRecovery() {
    Get.toNamed(Routes.RECOVER_PASSWORD);
  }

  void register() {
    Get.offNamed(Routes.REGISTER);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    Dialogs.showLoadingDialog();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // User is successfully signed in
      logger.i('User signed in: ${userCredential.user!.displayName}');
      Dialogs.closeCurrentDialog();

      Snackbars.showInfoSnackbar('Success', 'User signed in successfully');
    } on FirebaseAuthException catch (e) {
      Dialogs.closeCurrentDialog();
      handleAuthError(e);

      Snackbars.showErrorSnackbar(e.message!);
    } catch (e) {
      Dialogs.closeCurrentDialog();
      logger.e(e.toString());

      Snackbars.showErrorSnackbar(e.toString());
    }
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
