import 'package:flutter/material.dart';
import '../database_helper.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: FutureBuilder(
        future: DatabaseHelper.instance.getReports(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data as List<Map<String, dynamic>>;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(data[i]['plate']),
              subtitle: Text(data[i]['description']),
            ),
          );
        },
      ),
    );
  }
}


