import 'package:aqua_up/auth/sign_in.dart';
import 'package:aqua_up/lading%20page/landing.dart';
import 'package:aqua_up/mainscreen/homepage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splash extends StatefulWidget {
  splash({
    required this.title,
    required this.analytics,
    required this.observer,
  });
  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<splash> createState() =>
      _splashState(this.title, this.analytics, this.observer);
}

class _splashState extends State<splash> {
  late String title;
  late FirebaseAnalytics analytics;
  late FirebaseAnalyticsObserver observer;
  _splashState(this.title, this.analytics, this.observer);
  Future<Null> _sendanlytics() async {
    await widget.analytics
        .logEvent(name: 'Departments-brigade', parameters: <String, dynamic>{});
  }

  @override
  Widget build(BuildContext context) {
    bool is_login = login.get_login() ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/mainl.png'),
          // nextScreen: homepage( analytics : analytics , observer :observer),
          //  nextScreen: sign_in(),
          nextScreen: is_login ? homepage() : const landing()),
    );
  }
}
