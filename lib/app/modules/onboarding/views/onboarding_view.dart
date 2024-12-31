import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/dynamic_brightness.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  final List<Widget> onboardingPages;

  const OnboardingView({super.key, required this.onboardingPages});

  @override
  Widget build(BuildContext context) {
    return DynamicBrightness(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return onboardingPages[index];
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Opacity(
                      opacity: controller.currentPage.value == 0 ? 0 : 1,
                      child: BackwardButton(onPressed: controller.previousPage),
                    ),
                  ),
                  Spacer(),

                  // indicator
                  Row(
                    children: List.generate(
                      onboardingPages.length,
                      (index) {
                        return Obx(
                          () => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 8.0),
                            width: controller.currentPage.value == index
                                ? 12.0
                                : 8.0,
                            height: controller.currentPage.value == index
                                ? 12.0
                                : 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentPage.value == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Spacer(),

                  ForwardButton(onPressed: controller.nextPage),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
