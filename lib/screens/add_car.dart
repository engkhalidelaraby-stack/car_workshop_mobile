import 'package:flutter/material.dart';
import '../database_helper.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final plateController = TextEditingController();
  final ownerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Car')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: plateController,
              decoration: const InputDecoration(labelText: 'Plate'),
            ),
            TextField(
              controller: ownerController,
              decoration: const InputDecoration(labelText: 'Owner'),
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () async {
                await DatabaseHelper.instance.insertCar(
                  plateController.text,
                  ownerController.text,
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


