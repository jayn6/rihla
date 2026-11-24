
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Application settings saved on the device.
class ReglagesModel extends ChangeNotifier {
  static const _cle = 'sombre';

  bool _sombre = false;

  // Getter
  bool get sombre => _sombre;

  // Load the saved theme.
  Future<void> charger() async {
    final prefs = await SharedPreferences.getInstance();

    _sombre = prefs.getBool(_cle) ?? false;

    notifyListeners();
  }

  // Change and save the theme.
  Future<void> basculerTheme() async {
    _sombre = !_sombre;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_cle, _sombre);

    notifyListeners();
  }
}
