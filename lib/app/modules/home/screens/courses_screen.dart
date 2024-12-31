import 'package:flutter/material.dart';

import '../widgets/course_filter_panel.dart';
import '../widgets/course_list.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 14.0,
          right: 14.0,
          top: 14.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14.0,
          children: [
            Text(
              'Courses',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            CourseFilterPanel(),
            Expanded(
              child: CourseList(),
            ),
          ],
        ),
      ),
    );
  }
}
