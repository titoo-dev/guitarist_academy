import 'package:flutter/material.dart';

import '../widgets/dashboard_banner.dart';
import '../widgets/dashboard_content.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/weekly_task.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          DashboardHeader(),
          DashboardBanner(),
          Expanded(
            child: DashboardContent(
              weeklyTasks: [
                WeeklyTask(
                  weekNumber: 1,
                  color: Theme.of(context).colorScheme.primary,
                  completedLessons: 12,
                  totalLessons: 12,
                ),
                WeeklyTask(
                  weekNumber: 2,
                  color: Theme.of(context).colorScheme.secondary,
                  completedLessons: 1,
                  totalLessons: 5,
                ),
                WeeklyTask(
                  weekNumber: 3,
                  color: Theme.of(context).colorScheme.secondary,
                  completedLessons: 0,
                  totalLessons: 5,
                ),
                WeeklyTask(
                  weekNumber: 4,
                  color: Theme.of(context).colorScheme.secondary,
                  completedLessons: 0,
                  totalLessons: 5,
                ),
                WeeklyTask(
                  weekNumber: 5,
                  color: Theme.of(context).colorScheme.secondary,
                  completedLessons: 0,
                  totalLessons: 5,
                ),
                WeeklyTask(
                  weekNumber: 6,
                  color: Theme.of(context).colorScheme.secondary,
                  completedLessons: 0,
                  totalLessons: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
