import 'package:flutter/material.dart';

class info extends StatefulWidget {
  const info();

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          'About',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      // body: Column(
      //   children: [
      //      const SizedBox(
      //             height: 50,
      //           ),

      //      Padding(
      //       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      //       child: Row(
      //         children: [
      //           IconButton(
      //               onPressed: () {
      //                 Get.back();
      //               },
      //               icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      //         ],
      //       ),
      //     ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Aqua up is an app for tracking the water quantity you drink. The specialty of this app is flexibility, you don't need to type always the value(ml) you drink you can use the gestures we provided (in the how to use section). You want to set the values for the gesture, one gesture for increment and another gesture for decrement. Another important feature is facts about water, these facts are more information that will increase knowledge about water.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                ),
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
              const Text(
                'Double tap to increment fixed ml',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 300, child: Image.asset('assets/info2.png')),
              const Text(
                'Hold to decrement fixed ml',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 300, child: Image.asset('assets/list.png')),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Tap the menu bar , set the fixed value for swipe  , liters per day and to check ml ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 300, child: Image.asset('assets/info4.png')),
              const Text(
                'Swipe the bar to know facts about water',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(child: Icon(Icons.edit , color: Colors.blue,)),
               const SizedBox(
                height: 60,
              ),
              const Text(
                'Tap the edit button to set the different values for using gestures',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
