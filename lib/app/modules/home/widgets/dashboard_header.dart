import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class DashboardHeader extends GetView<HomeController> {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final name = controller.currentUser.displayName;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              Text(
                'Welcome, $name',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Get ready to learn and have fun',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),

          Spacer(),

          // circle avatar
          GestureDetector(
            onTap: controller.openSetting,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Lottie.asset(
                'assets/avatar1.json',
                height: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
