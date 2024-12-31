import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/choose_avatar_controller.dart';

class ChooseAvatarView extends GetView<ChooseAvatarController> {
  const ChooseAvatarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              'Choose your avatar',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              child: Text(
                'Choose an avatar that best represents you. You can change this later.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // grid view of avatars
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GetBuilder<ChooseAvatarController>(
                id: 'choose_avatar',
                builder: (state) {
                  return GridView.builder(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 60.0,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: controller.avatars.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.chooseAvatar(index);
                        },
                        child: CircleAvatar(
                          backgroundColor: state.selectedAvatarIndex == index
                              ? Theme.of(context).primaryColor
                              : Colors.grey[200],
                          radius: 100,
                          child: Lottie.asset(
                            controller.avatars[index],
                            height: 80,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: controller.confirmAvatar,
              child: Text('Continue'),
            ),
          )
        ],
      ),
    );
  }
}
