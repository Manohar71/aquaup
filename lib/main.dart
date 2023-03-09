import 'package:aqua_up/mainscreen/homepage.dart';
import 'package:aqua_up/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await userpreferences.init();
  await useml.init();
  FlutterError.onError = (errorDetails) {
    // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = new FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
   
    return  GetMaterialApp(
      
        navigatorObservers: <NavigatorObserver>[observer],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //! this is the analytics part  
      home: splash(
        title: 'opening app',
        analytics: analytics,
        observer: observer,

      ),
    );
  }
}
