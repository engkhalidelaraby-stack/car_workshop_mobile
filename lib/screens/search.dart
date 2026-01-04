import 'package:flutter/material.dart';
import '../database_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> results = [];

  void search(String keyword) async {
    results = await DatabaseHelper.instance.searchAll(keyword);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shearch')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Search'),
              onChanged: search,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text(results[i]['plate']),
                  subtitle: Text(results[i]['info']),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


