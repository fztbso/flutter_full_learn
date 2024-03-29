import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

class NavigatorManagerr {
  NavigatorManagerr._();
  static NavigatorManagerr instance = NavigatorManagerr._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateRoutes routes, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(routes.withParaf, arguments: arguments);
  }
}