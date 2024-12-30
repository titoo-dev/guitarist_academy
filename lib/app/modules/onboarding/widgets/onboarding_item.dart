import 'package:flutter/material.dart';

enum ImagePosition { top, bottom }

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.message,
    required this.title,
    required this.imagePath,
    this.imagePosition = ImagePosition.bottom,
  });

  final String message;
  final String title;
  final String imagePath;
  final ImagePosition imagePosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.0,
      children: [
        if (imagePosition == ImagePosition.top)
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(imagePath, height: 300),
          ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            title,
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
            constraints: BoxConstraints(maxWidth: 300),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (imagePosition == ImagePosition.bottom)
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(imagePath, height: 300),
          ),
      ],
    );
  }
}
