import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.calendar_month)),
          NavigationDestination(label: 'Analytics', icon: Icon(Icons.analytics)),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
