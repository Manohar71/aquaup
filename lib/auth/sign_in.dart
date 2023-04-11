import 'package:aqua_up/auth/widgets.dart';
import 'package:flutter/material.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Image.asset("assets/slogo.png"),
            ),
            Resuabletextfeild("Enter Username", Icons.mail, false, _emailcontroller),
            SizedBox( height: 20,),
            Resuabletextfeild("Enter Password", Icons.lock, true, _passwordcontroller)

            
          ],
        ),
      ),
    );
  }
}
