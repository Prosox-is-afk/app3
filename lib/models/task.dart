import 'package:flutter/material.dart';

class Task {
  final int id;
  final String title;
  final List<String> tags;
  final int nbhours;
  final int difficulty;
  final String description;
  final Color color;

  Task({
    required this.id,
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficulty,
    required this.description,
    required this.color,
  });

  // Génération de tâches factices
  static List<Task> generateTask(int count) {
    final List<Task> tasks = [];
    for (int n = 0; n < count; n++) {
      tasks.add(
        Task(
          id: n,
          title: "title $n",
          tags: ['tag $n', 'tag ${n + 1}'],
          nbhours: n,
          difficulty: n,
          description: "Description de la tâche $n",
          color: Colors.lightBlueAccent,
        ),
      );
    }
    return tasks;
  }

  // Construction depuis le JSON pour l’API locale
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Sans titre',
      tags: List<String>.from(json['tags'] ?? []),
      nbhours: json['nbhours'] ?? 0,
      difficulty: json['difficulty'] ?? json['difficuty'] ?? 0,
      description: json['description'] ?? '',
      color: Colors.teal,
    );
  }
}
