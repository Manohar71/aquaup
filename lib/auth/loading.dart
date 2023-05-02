import 'package:flutter/material.dart';


class loader extends StatefulWidget {
  const loader({super.key});

  @override
  State<loader> createState() => _loaderState();
}

class _loaderState extends State<loader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset('assets/slogo.png'),
           SizedBox(height: 50,),
          CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 3,
            ),
         ],
       ),
     ),
    );
  }
}