import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class insert extends StatefulWidget {
  const insert();

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {
  final controller = TextEditingController();
  final controller1 = TextEditingController();
  bool loading = false;
  final dbref = FirebaseDatabase.instance.ref('facts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Enter teh image URL', border: OutlineInputBorder()),
          ),
          TextFormField(
            controller: controller1,
            decoration: const InputDecoration(
                hintText: 'Enter the fact', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                await dbref.push().set({
                  'image': controller.text.toString(),
                  'text': controller1.text.toString(),
                });
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
