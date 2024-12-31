import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/dismiss_keyboard.dart';
import '../../../shared/widgets/dynamic_brightness.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return DissmisKeyboard(
      child: DynamicBrightness(
        outsideSafeAreaColor: Theme.of(context).colorScheme.primary,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              spacing: 20.0,
              children: [
                AuthHeader(),
                LoginContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: 20,
            child: AppLogo(
              size: 30,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Image.asset('assets/onboard3.png', height: 200),
            ),
          )
        ],
      ),
    );
  }
}

class LoginContent extends GetView<AuthController> {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8.0,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Log in',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(14.0),
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

              // label: Password
              Text(
                'Password',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '********',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
            ],
          ),
        ),

        // forgot password text button

        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: 'Forgot Password?',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = controller.initiatePasswordRecovery,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: controller.login,
            child: Text('Login'),
          ),
        ),

        // don't have an account text button and sign up text button
        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                color:
                    Theme.of(context).textTheme.bodyLarge?.color ?? Colors.grey,
              ),
              children: [
                TextSpan(
                  text: ' Sign Up',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = controller.register,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
