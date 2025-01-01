import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../shared/enums.dart';
import '../../../shared/theme.dart';
import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/dynamic_brightness.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return DynamicBrightness(
      child: Scaffold(
        body: Column(
          spacing: 20,
          children: [
            CourseDetailHeader(),
            Expanded(child: CourseDetailContent()),
          ],
        ),
      ),
    );
  }
}

class CourseDetailHeader extends StatelessWidget {
  const CourseDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
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

class CourseDetailContent extends StatelessWidget {
  const CourseDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8.0,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Fingerstyle In 7 Days',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            'Learn the basics of fingerstyle guitar in just 7 days. This course is designed for beginners who want to learn fingerstyle guitar. You will learn the basics of fingerstyle guitar, how to play fingerstyle guitar, and how to play fingerstyle guitar songs.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),

        // sized box with height 20
        SizedBox(height: 8),

        // divider with trickness 3
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: LinearProgressIndicator(
            value: 0.0, // Example progress value
            backgroundColor: kGreyColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              kSuccessColor,
            ),
          ),
        ),
        // progress label
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            '0 of 10 lessons completed',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),

        Expanded(child: ModuleList()),
      ],
    );
  }
}

class ModuleList extends StatelessWidget {
  const ModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            'Modules',
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
                return ModuleItem(
                  index: index,
                  status: ModuleStatus.inProgress,
                );
              }
              return ModuleItem(index: index);
            },
          ),
        ),
      ],
    );
  }
}

class ModuleItem extends GetView<HomeController> {
  const ModuleItem({
    super.key,
    required this.index,
    this.status = ModuleStatus.locked,
  });

  final int index;

  final ModuleStatus status;

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
        'Module ${index + 1}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text('01:23'),
    );
  }

  Widget _buildStatusIcon(ModuleStatus status) {
    switch (status) {
      case ModuleStatus.completed:
        return Icon(
          LineIcons.check,
          color: colorScheme.onPrimary,
        );
      case ModuleStatus.inProgress:
        return Icon(
          LineIcons.play,
          color: colorScheme.onPrimary,
        );
      case ModuleStatus.locked:
        return Icon(
          LineIcons.lock,
          color: colorScheme.onPrimary,
        );
    }
  }

  Color _buildStatusColor(ModuleStatus status) {
    switch (status) {
      case ModuleStatus.completed:
        return kSuccessColor;
      case ModuleStatus.inProgress:
        return colorScheme.primary;
      case ModuleStatus.locked:
        return kGreyColor;
    }
  }
}
