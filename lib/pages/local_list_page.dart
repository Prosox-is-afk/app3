import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_detail_page.dart';

class LocalListPage extends StatelessWidget {
  const LocalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Task.generateTask(20);
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
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
  }
}
