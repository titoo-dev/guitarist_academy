import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme.dart';
import '../controllers/home_controller.dart';

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
                  selectedColor: kBrightSkyBlue,
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
