// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:spacex_latest_launch/view/home/view/home_view.dart' as _i2;
import 'package:spacex_latest_launch/view/splash/view/splash_view.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    HomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SplashRoute.name, path: '/'),
        _i3.RouteConfig(HomeRoute.name, path: '/home-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-view');

  static const String name = 'HomeRoute';
}
