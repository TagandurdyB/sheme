import 'package:flutter/material.dart';

class MyNavigation extends StatelessWidget {
  const MyNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined), label: "User"),
    ]);
    // return NavigationBar(destinations: [
    //   IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
    //   IconButton(
    //       onPressed: () {},
    //       icon: const Icon(Icons.supervised_user_circle_outlined)),
    // ]);
  }
}
