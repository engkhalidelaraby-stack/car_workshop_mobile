import 'package:flutter/material.dart';
import '../database_helper.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final plateController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Report')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: plateController,
              decoration: const InputDecoration(labelText: 'Plate'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () async {
                await DatabaseHelper.instance.insertReport(
                  plateController.text,
                  descController.text,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


