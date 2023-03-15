import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

import '../../303/lottie_learn.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings){
    if(routeSettings.name?.isEmpty ?? true){
      return _navigateToNormal(LottieLearn());
    }

    if(routeSettings.name == NavigatorRoutes.paraf){
      return _navigateToNormal(LottieLearn()); }

    final _routes = routeSettings.name == NavigatorRoutes.paraf ? NavigateRoutes.init : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch(_routes) {

      case NavigateRoutes.init:
        return _navigateToNormal(LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(NavigateHomeView());
      case NavigateRoutes.detail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(NavigateHomeDetail(
          id: _id is String ? _id : null,
        ),
        isFullScreenDialog: true
        );
    }

  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}){
    return MaterialPageRoute(
        fullscreenDialog: isFullScreenDialog ?? false,
        builder: (context){
      return child;
    });
  }
}