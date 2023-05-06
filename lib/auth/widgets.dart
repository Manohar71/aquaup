import 'package:aqua_up/auth/sign_up.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

TextField Resuabletextfeild(String Text, IconData icon, bool ispassword,
    TextEditingController controller) {
  bool yes = ispassword;
  return TextField(
      controller: controller,
      obscureText: yes,
      autocorrect: !yes,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: Text,
        prefixIcon: Icon(
          icon,
          color: Colors.blue,
        ),
        // suffixIcon:IconButton(
        //   onPressed: (){
        // }, icon: Icon(Icons.visibility_off))),
      ));
}

GestureDetector auth_button(
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
        islogin ? 'Sign In' : "Sign Up",
        style: TextStyle(color: Colors.white),
      )),
    ),
  );
}

Row gotoSignup(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't you have an Account ? "),
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const sign_up()));
          },
          child: const Text(
            "Sign up",
            style: TextStyle(color: Colors.blue),
          ))
    ],
  );
}
