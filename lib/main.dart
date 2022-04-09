import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/init/theme/dark_theme.dart';
import 'core/init/theme/light_theme.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'core/constants/enums/preferences_keys.dart';
import 'core/constants/enums/theme_values_enum.dart';
import 'core/init/navigation/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  getIt.registerSingleton<AppRouter>(AppRouter());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  String themeValue = sharedPreferences
          .getString(PreferencesKeys.THEME.toString()) ??
      (SchedulerBinding.instance!.window.platformBrightness == Brightness.dark
          ? ThemeValues.DARK.toString()
          : ThemeValues.LIGHT.toString());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(
            themeValue == ThemeValues.DARK.toString()
                ? darkThemeData()
                : lightThemeData(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 500));
}

final getIt = GetIt.instance;

final router = getIt<AppRouter>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (_, ThemeNotifier themeNotifier, __) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.theme,
        routerDelegate: AutoRouterDelegate(router),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
