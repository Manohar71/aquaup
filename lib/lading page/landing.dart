import 'package:aqua_up/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        showSkipButton: true,
        done: Text("Done"),
        onDone: () {
           Get.to(() => const sign_in());
        },
        skip: Text("Skip"),
        onSkip: () {
           Get.to(() => const sign_in());
        },
        next: Text("Next"),
        
      pages: [
        PageViewModel(
          title: "The world of Gestures",
          body: "Update your water tracking levels by Hand tap Gestures",
          image: Image.asset('assets/water1.png')
        ),
         PageViewModel(
          title: "Update default values",
          body: "Can update default gesture values",
          image: Image.asset('assets/update.png')
        ),
         PageViewModel(
          title: "Tracking",
          body: "Track your Monthly / weekly / yearly water levels",
          image: Image.asset('assets/track.png')
        )
      ],
      ),
    );
  }
}