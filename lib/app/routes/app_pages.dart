import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/choose_avatar/bindings/choose_avatar_binding.dart';
import '../modules/choose_avatar/views/choose_avatar_view.dart';
import '../modules/course_detail/bindings/course_detail_binding.dart';
import '../modules/course_detail/views/course_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/screens/courses_screen.dart';
import '../modules/home/screens/dashboard_screen.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lesson_detail/bindings/lesson_detail_binding.dart';
import '../modules/lesson_detail/views/lesson_detail_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/onboarding/widgets/onboarding_item.dart';
import '../modules/recover_password/bindings/recover_password_binding.dart';
import '../modules/recover_password/views/recover_password_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../shared/enums.dart';

part 'app_routes.dart';

const onboardingItems = [
  OnboardingItem(
    imagePath: 'assets/onboard1.png',
    title: 'Hi & Welcome',
    message:
        'My name is Kerry (KK for short) and as your virual coach, I\'m going to help you learn to play the guitar over the next 6 weeks.',
  ),
  OnboardingItem(
    imagePath: 'assets/onboard2.png',
    title: 'But To Help Me Help You...',
    message:
        'You will need to commit to doing the following two things on a daily basis...',
    imagePosition: ImagePosition.top,
  ),
  OnboardingItem(
    imagePath: 'assets/onboard3.png',
    title: 'Complete At Least 1 Lesson Per Day',
    message:
        'Don\'t worry, You don\'t need to spend practicing. Just a 10-15 minutes a day is all that\'s needed.',
    imagePosition: ImagePosition.top,
  ),
];

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(
        pages: [
          DashboardScreen(),
          CoursesScreen(),
          Center(child: Text('Tuner')),
        ],
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(
        onboardingPages: onboardingItems,
      ),
      binding: OnboardingBinding(onboardingItems: onboardingItems),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.RECOVER_PASSWORD,
      page: () => const RecoverPasswordView(),
      binding: RecoverPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_AVATAR,
      page: () => const ChooseAvatarView(),
      binding: ChooseAvatarBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_DETAIL,
      page: () => const CourseDetailView(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: _Paths.LESSON_DETAIL,
      page: () => const LessonDetailView(),
      binding: LessonDetailBinding(),
    ),
  ];
}
