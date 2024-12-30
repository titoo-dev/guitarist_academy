import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.0,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Hi & Welcome',
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
              'My name is Kerry (KK for short) and as your virual coach, I\'m going to help you learn to play the guitar over the next 6 weeks.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // image
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(
            'assets/onboard3.png',
            height: 300,
          ),
        ),
      ],
    );
  }
}
