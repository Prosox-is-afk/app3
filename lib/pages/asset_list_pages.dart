import 'package:flutter/material.dart';
import '../api/my_api.dart';
import '../models/task.dart';
import 'task_detail_page.dart';

class AssetListPage extends StatelessWidget {
  const AssetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: MyAPI().getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        }
        final tasks = snapshot.data ?? [];
        if (tasks.isEmpty) {
          return const Center(child: Text('Aucune tâche.'));
        }
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, i) {
            final t = tasks[i];
            return ListTile(
              title: Text('${t.title}  (#${t.id})'),
              subtitle: Text('tags: ${t.tags.join(", ")}  •  ${t.nbhours}h'),
              trailing: CircleAvatar(child: Text('${t.difficulty}')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TaskDetailPage(task: t)),
                );
              },
            );
          },
        );
      },
    );
  }
}
