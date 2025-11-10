import 'package:flutter/material.dart';
import 'package:app2/mytheme.dart';

import 'pages/local_list_page.dart';
import 'pages/asset_list_page.dart';
import 'pages/rest_list_page.dart';

void main() {
  runApp(const TD2App());
}

class TD2App extends StatefulWidget {
  const TD2App({super.key});

  @override
  State<TD2App> createState() => _TD2AppState();
}

class _TD2AppState extends State<TD2App> {
  int _selectedIndex = 0;

  final _pages = const [
    LocalListPage(), // liste générée localement
    AssetListPage(), // liste via tasks.json
    RestListPage(), // liste via API REST
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TD2 Flutter',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'TD2 – Gestion de tâches',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: Center(child: _pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Local'),
            BottomNavigationBarItem(icon: Icon(Icons.storage), label: 'JSON'),
            BottomNavigationBarItem(icon: Icon(Icons.public), label: 'REST'),
          ],
        ),
      ),
    );
  }
}
