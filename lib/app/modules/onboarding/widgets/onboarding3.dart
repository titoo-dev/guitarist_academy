import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
            'assets/onboard1.png',
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
              'Complete At Least 1 Lesson Per Day',
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
              'Don\'t worry, You don\'t need to spend practicing. Just a 10-15 minutes a day is all that\'s needed.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
