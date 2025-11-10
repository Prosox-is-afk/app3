import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/task.dart';

class MyAPI {
  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    final dataString = await _loadAsset('assets/json/tasks.json');
    final Map<String, dynamic> jsonMap = jsonDecode(dataString);
    final tasks = <Task>[];
    if (jsonMap['tasks'] != null) {
      for (final e in jsonMap['tasks']) {
        tasks.add(Task.fromJson(Map<String, dynamic>.from(e)));
      }
    }
    return tasks;
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
