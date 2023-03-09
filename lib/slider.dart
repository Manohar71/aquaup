import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mainscreen/facts.dart';

class slider extends StatefulWidget {
  const slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  
  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
      backgroundColor: Colors.blue,
      toggleColor: Colors.blue[200],
      height: 55,
      width: MediaQuery.of(context).size.width * 0.7,
      child: const Text(
        'Know about water',
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),
      ),
      action: (controller) {
        Get.to(() => facts());
      },
    );
  }
}
