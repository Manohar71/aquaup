import 'package:aqua_up/auth/widgets.dart';
import 'package:aqua_up/mainscreen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text("Sign Up")
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Resuabletextfeild("Enter Username", Icons.account_circle,
                false, usernamecontroller),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Resuabletextfeild(
                "Enter Email", Icons.email, false, emailcontroller),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Resuabletextfeild(
                "Enter Password", Icons.password, true, passwordcontroller),
          ),
          const SizedBox(
            height: 20,
          ),
          auth_button(context, false, () {
            FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: emailcontroller.text,
                    password: passwordcontroller.text).then((value) => {
                      ref.child(value.user!.uid.toString()).set({
                         'uid':value.user!.uid.toString(),
                         'email':value.user!.email.toString(),
                         'username':usernamecontroller.text
                      })
                    })
                .then((value) => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homepage()))
                    .onError((error, stackTrace) =>
                        print("error ${error.toString()}")));
          })
        ],
      ),
    );
  }
}
