import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/dismiss_keyboard.dart';
import '../controllers/recover_password_controller.dart';

class RecoverPasswordView extends GetView<RecoverPasswordController> {
  const RecoverPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return DissmisKeyboard(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    BackwardButton(onPressed: Get.back),
                  ],
                ),
              ),
              SizedBox(height: 28.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Forgot Password',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16.0,
                  children: [
                    // label: Email
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Reset Password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
