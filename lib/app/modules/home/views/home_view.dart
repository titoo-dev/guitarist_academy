import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
    final navigationBarItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Courses'),
      BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_outlined), label: 'More'),
    ];
    return Scaffold(
      bottomNavigationBar: GetX<HomeController>(
        builder: (state) {
          return BottomNavigationBar(
            items: navigationBarItems,
            onTap: controller.onTap,
            currentIndex: state.currentIndex.value,
          );
        },
      ),
      body: Navigator(
        initialRoute: initialRoute.toString(),
        key: HomeController.navigatorKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => pages[int.parse(settings.name!)],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HomeViewHeader(),
          HomeViewBanner(),
          Expanded(child: HomeViewContent()),
        ],
      ),
    );
  }
}

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

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

class HomeViewBanner extends StatelessWidget {
  const HomeViewBanner({super.key});

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

class HomeViewContent extends StatelessWidget {
  const HomeViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
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
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Course ${index + 1}'),
                  subtitle: Text('This is a course description'),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
