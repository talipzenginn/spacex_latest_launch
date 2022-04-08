import 'package:auto_route/auto_route.dart';
import '../../../view/home/view/home_view.dart';
import '../../../view/splash/view/splash_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(page: HomeView),
  ],
)
class $AppRouter {}
