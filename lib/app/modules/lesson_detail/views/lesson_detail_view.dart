import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lesson_detail_controller.dart';

class LessonDetailView extends GetView<LessonDetailController> {
  const LessonDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LessonDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LessonDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
