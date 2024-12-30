import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.0,
      children: [
        // image
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(
            'assets/onboard2.png',
            height: 300,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            child: Text(
              'But To Help Me Help You...',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            child: Text(
              'You will need to commit to doing the following two things on a daily basis...',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
