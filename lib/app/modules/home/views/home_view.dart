import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../shared/theme.dart';
import '../../../shared/widgets/dynamic_brightness.dart';
import '../controllers/home_controller.dart';

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
    return DynamicBrightness(
      child: Scaffold(
        bottomNavigationBar: GetX<HomeController>(
          builder: (state) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
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
                        text: 'Tuner',
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
      ),
    );
  }
}
