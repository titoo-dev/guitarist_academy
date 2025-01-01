import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../shared/widgets/dynamic_brightness.dart';
import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return DynamicBrightness(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email verification icon
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                LineIcons.envelope,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),

            // email verification text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Email Verification',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // email verification content
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // email verification text
                  Text(
                    'A verification email has been sent to your email address. Please verify your email address to continue.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // resend verification email button
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                ),
                onPressed: controller.resendEmail,
                child: Text('Resend Verification Email'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
