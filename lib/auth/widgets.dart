import 'package:flutter/material.dart';

TextField Resuabletextfeild(String Text, IconData icon, bool ispassword,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: ispassword,
    autocorrect: !ispassword,
    cursorColor: Colors.blue,
    decoration: InputDecoration(
      prefixIcon: Icon(icon , color: Colors.blue,)
    ),
  );
}
