import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todos.dart';

class TodoConnection {
  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors du chargement des todos');
    }
  }
}