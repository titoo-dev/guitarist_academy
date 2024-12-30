import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: Icon(
            Icons.ac_unit,
            color: Colors.blue,
            size: 50,
          ),
        ),
      ),
    );
  }
}
