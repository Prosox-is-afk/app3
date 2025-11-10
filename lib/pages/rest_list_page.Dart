import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestListPage extends StatelessWidget {
  const RestListPage({super.key});

  Future<List<Map<String, dynamic>>> _fetchTodos() async {
    final resp = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=50'),
    );
    if (resp.statusCode == 200) {
      final list = jsonDecode(resp.body) as List;
      return List<Map<String, dynamic>>.from(list);
    }
    throw Exception('HTTP ${resp.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchTodos(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return Center(child: Text('Erreur: ${snap.error}'));
        }
        final todos = snap.data ?? [];
        return ListView.separated(
          itemCount: todos.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final t = todos[i];
            return ListTile(
              leading: Icon(
                t['completed'] == true ? Icons.check_circle : Icons.circle_outlined,
              ),
              title: Text('${t['title']}'),
              subtitle: Text('Todo #${t['id']} • user ${t['userId']}'),
            );
          },
        );
      },
    );
  }
}