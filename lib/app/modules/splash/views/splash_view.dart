import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/dynamic_brightness.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return SplashContent(controller: controller);
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({super.key, required this.controller});

  final SplashController controller;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamed(Routes.AUTH),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DynamicBrightness(
      outsideSafeAreaColor: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: AppLogo(),
        ),
      ),
    );
  }
}
