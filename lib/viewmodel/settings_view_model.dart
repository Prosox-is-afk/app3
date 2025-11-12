import 'package:flutter/cupertino.dart';
import '../repository/settings_repository.dart';

class SettingsViewModel extends ChangeNotifier {
  late bool _isDark;
  late SettingsRepository _settingRepository;
  bool get isDark => _isDark;

  SettingsViewModel() {
    _isDark = false;
    _settingRepository = SettingsRepository();
    _settingRepository.getSettings();
  }

  // switching themes
  set isDark(bool value) {
    _isDark = value;
    _settingRepository.saveSettings(value);
    notifyListeners();
  }

  Future<void> getSettings() async {
    _isDark = await _settingRepository.getSettings();
    notifyListeners();
  }
}
