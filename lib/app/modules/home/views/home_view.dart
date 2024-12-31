import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/theme.dart';
import '../controllers/home_controller.dart';
import '../widgets/weekly_task.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    super.key,
    required this.pages,
    this.initialRoute = 0,
  });

  final List<Widget> pages;

  final int initialRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetX<HomeController>(
        builder: (state) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black12,
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: gNavRippleColor!,
                  hoverColor: gNavHoverColor!,
                  gap: 8,
                  activeColor: gNavActiveColor,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: gNavTabBackgroundColor,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineIcons.book,
                      text: 'Lessons',
                    ),
                    GButton(
                      icon: LineIcons.guitar,
                      text: 'Tool',
                    ),
                  ],
                  selectedIndex: state.currentIndex.value,
                  onTabChange: controller.onTap,
                ),
              ),
            ),
          );
        },
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
      ),
    );
  }
}

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

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              Text(
                'Welcome, John',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Get ready to learn and have fun',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),

          Spacer(),

          // circle avatar
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            child: Lottie.asset(
              'assets/avatar1.json',
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Learn the basics of Playing the Guitar',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),

            // button
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(horizontal: 32),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Review',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

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

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    // gridview
    return GridView.builder(
      padding: EdgeInsets.only(top: 14.0),
      itemCount: 30,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: .95,
      ),
      itemBuilder: (context, index) {
        return CourseCard();
      },
    );
  }
}

class CourseFilterPanel extends GetView<HomeController> {
  const CourseFilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: GetX<HomeController>(builder: (state) {
        return ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (final category in ['All', 'Ongoing', 'Completed', 'Upcoming'])
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ChoiceChip(
                  label: Text(
                    category,
                    style: TextStyle(
                      color: state.selectedCategory.value == category
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  selected: state.selectedCategory.value == category,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  onSelected: (bool selected) {
                    if (selected) {
                      controller.selectCategory(category);
                    }
                  },
                ),
              ),
          ],
        );
      }),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      elevation: 1,
      color: Theme.of(context).colorScheme.surface,
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
              child: Image.asset(
                'assets/onboard1.png',
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
                    'Guitar Basics',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  LinearProgressIndicator(
                    value: 0.7, // Example progress value
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
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
