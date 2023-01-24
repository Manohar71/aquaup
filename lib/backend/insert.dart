import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class insert extends StatefulWidget {
  const insert({super.key});

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {
  final controller = TextEditingController();
  bool loading = false;
  final dbref = FirebaseDatabase.instance.ref('facts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: ' this looks good', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                await dbref.update({
                  'image': '',
                  'text':""
                  });
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
