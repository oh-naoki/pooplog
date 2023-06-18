import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pooplog/ui/main.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final goRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Center(child: Text("a")),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const Text("detail a"),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: '/analytics',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Text("b"),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const Text("detail b"),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
