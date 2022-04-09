import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/init/theme/dark_theme.dart';
import '../../core/constants/app_constants.dart';
import '../init/notifier/theme_notifier.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);

    return Row(
      children: [
        Text(
          themeProvider.theme == darkThemeData()
              ? AppConstants.dark
              : AppConstants.light,
        ),
        Switch.adaptive(
          activeColor: Theme.of(context).colorScheme.secondary,
          inactiveTrackColor: Theme.of(context).colorScheme.secondary,
          value: themeProvider.theme == darkThemeData() ? true : false,
          onChanged: (value) {
            final provider = Provider.of<ThemeNotifier>(context, listen: false);
            provider.toggleTheme(value);
          },
        ),
      ],
    );
  }
}
