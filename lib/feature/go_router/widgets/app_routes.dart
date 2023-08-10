import 'package:abstracts/feature/go_router/pages/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  GoRouter generateRoute = GoRouter(routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: GORouters());
      },
    ),
    GoRoute(
      name: 'profile',
      path: '/profile',
      pageBuilder: (context, state) {
        return MaterialPage(child: OneScreens());
      },
    ),
    GoRoute(
      name: 'twoscreens',
      path: '/twoscreens',
      pageBuilder: (context, state) {
        return MaterialPage(child: TwoScreens());
      },
    ),
    GoRoute(
      name: 'threescreens',
      path: '/threescreens',
      pageBuilder: (context, state) {
        return MaterialPage(child: ThreeScreens());
      },
    ),
  ]);
}
