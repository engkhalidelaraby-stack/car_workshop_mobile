import 'package:flutter/material.dart';
import 'add_car.dart';
import 'add_report.dart';
import 'reports_page.dart';
import 'search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Workshop')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Add Car'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddCarScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Add Report'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddReportScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Reports'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReportsPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Search'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
