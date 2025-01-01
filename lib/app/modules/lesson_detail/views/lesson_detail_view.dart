import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../shared/enums.dart';
import '../../../shared/theme.dart';
import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/dynamic_brightness.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/lesson_detail_controller.dart';

class LessonDetailView extends GetView<LessonDetailController> {
  const LessonDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return DynamicBrightness(
      child: Scaffold(
        body: Column(
          spacing: 20,
          children: [
            LessonDetailHeader(),
            Expanded(child: LessonDetailContent()),
          ],
        ),
      ),
    );
  }
}

class LessonDetailHeader extends StatelessWidget {
  const LessonDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: 14,
            child: BackwardButton(
              onPressed: Get.back,
              iconSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class LessonDetailContent extends StatelessWidget {
  const LessonDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Module 1',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'Introduction: What is Fingerstyle?',
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Learn the basics of fingerstyle guitar in just 7 days. This course is designed for beginners who want to learn fingerstyle guitar. You will learn the basics of fingerstyle guitar, how to play fingerstyle guitar, and how to play fingerstyle guitar songs.',
            style: Theme.of(context).textTheme.bodyMedium,
            softWrap: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: MaterialButton(
            onPressed: () {},
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            minWidth: 0,
            padding: EdgeInsets.all(14.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check, size: 20),
                SizedBox(width: 8),
                Text('Mark as Completed'),
              ],
            ),
          ),
        ),
        Expanded(child: LessonList()),
      ],
    );
  }
}

class LessonList extends StatelessWidget {
  const LessonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Next Lesson',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              if (index == 0) {
                return LessonItem(
                  index: index,
                  status: LessonStatus.inProgress,
                );
              }
              return LessonItem(index: index);
            },
          ),
        ),
      ],
    );
  }
}

class LessonItem extends GetView<HomeController> {
  const LessonItem({
    super.key,
    required this.index,
    this.status = LessonStatus.locked,
  });

  final int index;

  final LessonStatus status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: controller.tapModule,
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _buildStatusColor(status),
          borderRadius: BorderRadius.circular(14),
        ),
        child: _buildStatusIcon(status),
      ),
      title: Text(
        'Day ${index + 1}: the Right Hand',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text('01:23'),
    );
  }

  Widget _buildStatusIcon(LessonStatus status) {
    switch (status) {
      case LessonStatus.completed:
        return Icon(
          LineIcons.check,
          color: colorScheme.onPrimary,
        );
      case LessonStatus.inProgress:
        return Icon(
          LineIcons.play,
          color: colorScheme.onPrimary,
        );
      case LessonStatus.locked:
        return Icon(
          LineIcons.lock,
          color: colorScheme.onPrimary,
        );
    }
  }

  Color _buildStatusColor(LessonStatus status) {
    switch (status) {
      case LessonStatus.completed:
        return kSuccessColor;
      case LessonStatus.inProgress:
        return colorScheme.primary;
      case LessonStatus.locked:
        return kGreyColor;
    }
  }
}
