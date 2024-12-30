import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  final List<Widget> onboardingPages;

  const OnboardingView({super.key, required this.onboardingPages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: MaterialButton(
                      onPressed: controller.previousPage,
                      textColor: Theme.of(context).colorScheme.primary,
                      minWidth: 0,
                      padding: EdgeInsets.all(14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Icon(Icons.arrow_back_outlined),
                    ),
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
                MaterialButton(
                  onPressed: controller.nextPage,
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  minWidth: 0,
                  padding: EdgeInsets.all(14.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Icon(Icons.arrow_forward_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
