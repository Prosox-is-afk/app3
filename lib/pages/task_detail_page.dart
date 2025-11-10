import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;
  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Task #${task.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: text.headlineSmall),
            const SizedBox(height: 8),
            Text('Tags: ${task.tags.join(", ")}'),
            const SizedBox(height: 8),
            Text('Heures estimées: ${task.nbhours}h'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Difficulté: '),
                Chip(label: Text('${task.difficulty}')),
              ],
            ),
            const Divider(height: 24),
            Expanded(
              child: SingleChildScrollView(child: Text(task.description)),
            ),
          ],
        ),
      ),
    );
  }
}
