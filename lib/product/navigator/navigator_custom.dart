import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

import '../../303/lottie_learn.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings){
    if(routeSettings.name == "/"){
      return _navigateToNormal(LottieLearn());
    } else if(routeSettings.name == NavigateRoutes.detail.withParaf){
      final _id = routeSettings.arguments;
      return _navigateToNormal(NavigateHomeDetail(
        id: _id is String ? _id : null,
      ));
    }
    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child){
    return MaterialPageRoute(builder: (context){
      return child;
    });
  }
}