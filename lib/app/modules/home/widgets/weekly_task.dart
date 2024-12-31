import 'package:flutter/material.dart';

import '../../../shared/theme.dart';

class WeeklyTask {
  const WeeklyTask({
    required this.weekNumber,
    required this.color,
    required this.completedLessons,
    required this.totalLessons,
  });

  final int weekNumber;
  final Color color;
  final int completedLessons;
  final int totalLessons;

  Step getStep(BuildContext context) {
    return Step(
      stepStyle: StepStyle(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
      ),
      title: Text('Week $weekNumber',
          style: Theme.of(context).textTheme.titleMedium),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    color: kOnPrimaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.calendar_month_outlined,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '$completedLessons of $totalLessons Lessons Completed',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      state: getStepState(),
    );
  }

  StepState getStepState() {
    if (completedLessons == totalLessons) {
      return StepState.complete;
    }

    if (completedLessons > 0) {
      return StepState.indexed;
    }

    return StepState.disabled;
  }
}
