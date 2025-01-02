import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme.dart';
import '../controllers/home_controller.dart';

class CourseCard extends GetView<HomeController> {
  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.progress,
  });

  final String imageUrl;
  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: controller.tapCourse,
      padding: EdgeInsets.zero,
      elevation: 1,
      color: Theme.of(context).colorScheme.surface,
      highlightColor: kOnPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  LinearProgressIndicator(
                    value: progress, // Example progress value
                    backgroundColor: kGreyColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      kSuccessColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
