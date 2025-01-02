import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/dialogs.dart';
import '../../../shared/snackbars.dart';

class SettingController extends GetxController {
  final userNameFormKey = GlobalKey<FormBuilderState>();

  final passwordFormKey = GlobalKey<FormBuilderState>();

  void changeUserName() {
    // validate form
    if (userNameFormKey.currentState!.saveAndValidate()) {
      // get form data
      final name =
          userNameFormKey.currentState!.fields['name']!.value as String;

      // update user name
      debugPrint('User name: $name');
    }
  }

  void deleteAccount() {}

  void changePassword() {
    // validate form
    if (passwordFormKey.currentState!.saveAndValidate()) {
      // get form data
      final oldPassword =
          passwordFormKey.currentState!.fields['old_password']!.value as String;
      final newPassword =
          passwordFormKey.currentState!.fields['new_password']!.value as String;

      // update password
      debugPrint('Old Password: $oldPassword');
      debugPrint('New Password: $newPassword');
    }
  }

  void logout() async {
    Dialogs.showLoadingDialog();
    try {
      await FirebaseAuth.instance.signOut();

      // add 3 seconds delay to show the loading dialog
      await Future.delayed(const Duration(seconds: 3));

      Dialogs.closeCurrentDialog();

      Get.offAllNamed(Routes.AUTH);
    } catch (e) {
      Dialogs.closeCurrentDialog();
      Snackbars.showErrorSnackbar(e.toString());
    }
  }
}
