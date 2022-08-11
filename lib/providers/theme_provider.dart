import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider(this.themeMode);
  ThemeMode themeMode;

  String switchToText(BuildContext context) {
    return 'Switch to ${Theme.of(context).brightness == Brightness.dark ? 'Light' : 'Dark'}';
  }

  Future<void> toggleTheme(bool newValue) async {
    themeMode = newValue ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('isDarkMode', newValue);
  }
}
