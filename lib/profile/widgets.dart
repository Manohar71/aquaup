import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';


GestureDetector profile_button(
    BuildContext context, bool islogin, Function ontap) {
  return GestureDetector(
    onTap: () {
      ontap();
    },
    child: Container(
      height: 40,
      width: 100,
      decoration: ShapeDecoration(
        color: Colors.blue,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 15,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: Center(
          child: Text(
        islogin ? 'Log Out' : "Cancel",
        style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
      )),
    ),
  );
}