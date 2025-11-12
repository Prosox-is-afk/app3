import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/viewmodel.dart';
import 'viewmodel/settings_view_model.dart';
import 'viewmodel/task_view_model.dart';
import 'repository/settings_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'UI/mytheme.dart';
import 'UI/home.dart';

void main() {
  runApp(MyTD2App());
}

class MyTD2App extends StatelessWidget {
  const MyTD2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsViewModel>(
          create: (_) {
            SettingsViewModel settingsViewModel = SettingsViewModel();
            //getSettings() est déjà appelé dans le constructeur
            return settingsViewModel;
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            TaskViewModel taskViewModel = TaskViewModel();
            taskViewModel.generateTask();
            return taskViewModel;
          },
        ),
      ],
      child: Consumer(
        builder: (context, SettingsViewModel notifier, child) {
          return MaterialApp(
            theme: notifier.isDark ? MyTheme.dark() : MyTheme.light(),
            title: "TD2",
            home: Home(),
          );
        },
      ),
    );
  }
}
