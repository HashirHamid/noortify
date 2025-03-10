import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noortify/modules/grid/views/grid_screen.dart';
import 'package:noortify/modules/home/views/home_screen.dart';
import 'package:noortify/modules/navigation/controllers/navigation_controller.dart';
import 'package:noortify/modules/profile/views/profile_screen.dart';
import 'package:noortify/modules/search/views/search_screen.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    GridScreen(),
    ProfileScreen()
  ];

  final appBars = [
    AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/image.png"),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Home",
            style: TextStyle(
              color: const Color.fromARGB(255, 189, 189, 189),
              fontWeight: FontWeight.w500,
              fontSize: 12.29,
            ),
          ),
          Text(
            "Andrey Thomson",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.39,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Badge(
            backgroundColor: const Color.fromARGB(244, 255, 2, 2),
            label: null,
            isLabelVisible: true,
            smallSize: 8,
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 28,
            ),
          ),
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_box,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    ),
    AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Search",
            style: TextStyle(
              color: const Color.fromARGB(255, 248, 248, 248),
              fontWeight: FontWeight.w500,
              fontSize: 32,
            ),
          ),
          const Spacer(),
          Text(
            "Wifi:tw1r_413_7G",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    null,
    null
  ];

  final NavigationController navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(
          () =>
              appBars[navController.currentIndex.value] ??
              const SizedBox.shrink(),
        ),
      ),
      body: Obx(() => screens[navController.currentIndex.value]),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          height: 60,
          backgroundColor: const Color.fromARGB(255, 33, 29, 29),
          iconTheme: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                    color: Color.fromARGB(255, 255, 140, 29));
              }
              return const IconThemeData(
                  color: Color.fromARGB(255, 177, 177, 177));
            },
          ),
        ),
        child: Obx(
          () => NavigationBar(
            selectedIndex: navController.currentIndex.value,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.grid_view_outlined),
                label: 'Grid',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            onDestinationSelected: (index) {
              navController.currentIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
