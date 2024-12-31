import 'package:flutter/material.dart';

import 'weekly_task.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({
    super.key,
    required this.weeklyTasks,
  });

  final List<WeeklyTask> weeklyTasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '6 Week Guitar Challenge',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Stepper(
              stepIconBuilder: (stepIndex, stepState) {
                if (stepState == StepState.complete) {
                  return Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 16,
                  );
                }

                if (stepState == StepState.indexed) {
                  return Icon(
                    Icons.play_arrow,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  );
                }

                return Icon(
                  Icons.lock,
                  color: Colors.grey,
                  size: 16,
                );
              },
              type: StepperType.vertical,
              connectorThickness: 1,
              controlsBuilder: (context, details) => SizedBox.shrink(),
              steps: [
                for (final task in weeklyTasks) task.getStep(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
