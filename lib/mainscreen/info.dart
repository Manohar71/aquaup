import 'package:flutter/material.dart';
import 'package:get/get.dart';

class info extends StatefulWidget {
  const info({super.key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                const Spacer()
              ],
            ),
          ),
          const Text(
            'About',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Expanded(
                child: Text(
              "Aqua up is an app for tracking the water quantity you drink. The specialty of this app is flexibility, you don't need to type always the value(ml) you drink you can use the gestures we provided (in the how to use section). You want to set the values for the gesture, one gesture for increment and another gesture for decrement. Another important feature is facts about water, these facts are more information that will increase knowledge about water.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300),
            )),
          ),
          const Text(
            'How To Use',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 300, child: Image.asset('assets/info1.png')),
          const Expanded(
              child: Text(
            'Double tap to increment fixed ml',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          )),
          SizedBox(height: 300, child: Image.asset('assets/info2.png')),
          const Expanded(
              child: Text(
            'Hold to decrement fixed ml',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          )),
          SizedBox(height: 300, child: Image.asset('assets/list.png')),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Expanded(
                child: Text(
              'Tap the menu bar , set the fixed value for swipe  , liters per day and to check ml ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            )),
          ),
          SizedBox(height: 300, child: Image.asset('assets/info4.png')),
          const Expanded(
              child: Text(
            'Swipe the bar to know facts about water',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          )),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
