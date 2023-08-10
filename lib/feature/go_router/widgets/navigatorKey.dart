
import 'package:flutter/material.dart';
final GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  Future<void>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }
}
