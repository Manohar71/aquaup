import 'package:aqua_up/backend/insert.dart';
import 'package:aqua_up/dimensions.dart';
import 'package:aqua_up/mainscreen/facts.dart';
import 'package:aqua_up/mainscreen/info.dart';
import 'package:aqua_up/navigation.dart';
import 'package:aqua_up/slider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:circular_usage_indicator/circular_usage_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  late int defml;
  late int deflit;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  homepage({
    required this.deflit,
    required this.defml,
    required this.analytics,
    required this.observer,
  });
  @override
  State<homepage> createState() =>
      _homepageState(deflit, defml, analytics, observer);
}

class _homepageState extends State<homepage> {
  double value = 0;
  int ml = 0;
  late int deflit;
  late int defml;
  late FirebaseAnalytics analytics;
  late FirebaseAnalyticsObserver observer;
  _homepageState(this.deflit, this.defml, this.analytics, this.observer);

  Future<Null> _sendanlytics() async {
    await widget.analytics
        .logEvent(name: 'app_Home', parameters: <String, dynamic>{});
  }

  @override
  void initState() {
    super.initState();
    value = userpreferences.getvalue() ?? 0;
    ml = useml.getvalue() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigation(),
      body: Builder(builder: (context) {
        return Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
                GestureDetector(
                    onTap: () async {
                      await _sendanlytics();
                      Get.to(() => facts());
                    },
                    child: SizedBox(
                        height: 60, child: Image.asset('assets/mainl.png'))),
                IconButton(
                    onPressed: () {
                      Get.to(() => info());
                      // Get.to(() => insert());
                    },
                    icon: const Icon(Icons.info_outline))
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Lottie.asset('assets/lottie.json')),
            GestureDetector(
              onDoubleTap: () async {
                setState(() {
                  if (value < 1.0) {
                    ml = ml + defml;
                    value = ml / (deflit * 1000);
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                                  child: SizedBox(
                                    height: screenHeight(context)*0.5,
                                    width: screenWidth(context)*0.9,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 50,),
                                        SizedBox(
                                          height: screenHeight(context)*0.3,

                                          child: Image.asset('assets/congrats.jpg')),
                                        Text("Congratulations" , style: TextStyle(color: Colors.blue ,fontSize: 20 ,fontWeight: FontWeight.bold ),),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Text("You have completed today's challenge" , style: TextStyle(fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                  ),
                          );
                        });
                  }
                });
                await useml.setml(ml);
                await userpreferences.setvalue(value);
              },
              onLongPress: () async {
                setState(() {
                  if (value > 0) {
                    ml = ml - defml;
                    value = ml / (deflit * 1000);
                    print(value);
                  }
                });
                await useml.setml(ml);
                await userpreferences.setvalue(value);
              },
              child: CircularUsageIndicator(
                elevation: 15.0,
                backgroundColor: const Color(0xFFD4DFE5),
                borderColor: Colors.transparent,
                progressValue: value,
                progressLabelStyle: const TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                progressColor: value <= 0.5 ? Colors.blue[300] : Colors.blue,
                size: 300,
                borderWidth: 1.0,
              ),
            ),
            const Spacer(),
            const Center(child: slider()),
            SizedBox(
              height: 30,
            )
          ],
        );
      }),
    );
  }
}

class useml {
  static late SharedPreferences _prefer;

  static const _keyml = 'ml';

  static Future init() async => _prefer = await SharedPreferences.getInstance();

  static Future setml(int ml) async => await _prefer.setInt(_keyml, ml);
  static int? getvalue() => _prefer.getInt(_keyml);
}

class userpreferences {
  static late SharedPreferences _preferences;

  static const _keyvalue = 'value';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setvalue(double value) async =>
      await _preferences.setDouble(_keyvalue, value);

  static double? getvalue() => _preferences.getDouble(_keyvalue);
}
