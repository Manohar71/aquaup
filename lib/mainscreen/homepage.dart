import 'package:aqua_up/dimensions.dart';
import 'package:aqua_up/mainscreen/facts.dart';
import 'package:aqua_up/mainscreen/info.dart';
import 'package:aqua_up/navigation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:circular_usage_indicator/circular_usage_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  late int defml;
  late int deflit;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  homepage({
    required this.analytics,
    required this.observer,
  });
  @override
  State<homepage> createState() => _homepageState(analytics, observer);
}

class _homepageState extends State<homepage> {
  //TODO: This is the data

  double value = 0;
  int ml = 0;
  int edited_liter = 4;
  dynamic selected = setlit.get_val_lit() ?? 4;
  // int edited_ml = 100;
  List<int> list_item = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> list_ml = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
  dynamic ml_select = 100;

//! This is for the analytics

  late FirebaseAnalytics analytics;
  late FirebaseAnalyticsObserver observer;
  _homepageState(this.analytics, this.observer);

  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<void> _sendanlytics() async {
    await widget.analytics.logEvent(
      name: 'facts_page',
      parameters: <String, dynamic>{},
    );
    setMessage('logEvent succeeded');
  }

  Future<void> _sendinfo() async {
    await widget.analytics.logEvent(
      name: 'water_update',
      parameters: <String, dynamic>{},
    );
    setMessage('logEvent succeeded');
  }

  //! This is for the analytics
  @override
  void initState() {
    super.initState();
    value = userpreferences.getvalue() ?? 0;
    ml = useml.getvalue() ?? 0;
    edited_liter = setlit.get_val_lit() ?? 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const navigation(),
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
                      _sendanlytics();
                      Get.to(() => const facts());
                    },
                    child: SizedBox(
                        height: 60, child: Image.asset('assets/mainl.png'))),
                IconButton(
                    onPressed: () {
                      Get.to(() => const info());
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
                _sendinfo();
                setState(() {
                  if (value < 1.0) {
                    ml = ml + 100;
                    value = ml / (edited_liter * 1000);
                    print(ml);
                    print(edited_liter);
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: SizedBox(
                              height: screenHeight(context) * 0.5,
                              width: screenWidth(context) * 0.9,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  SizedBox(
                                      height: screenHeight(context) * 0.3,
                                      child:
                                          Image.asset('assets/congrats.jpg')),
                                  const Text(
                                    "Congratulations",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "You have completed today's challenge",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
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
                    ml = ml - 100;
                    value = ml / (edited_liter * 1000);
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
            Padding(
              padding: const EdgeInsets.only(left: 10 , right: 10),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue              ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 120,
                          child: DropdownButton(
                              hint: Text('Select liters'),
                              value: selected != setlit.get_val_lit() ? selected : setlit.get_val_lit(),
                              items: list_item
                                  .map((ite) => DropdownMenuItem<int>(
                                     alignment: AlignmentDirectional.center,
                                      value: ite, child: Text(ite.toString())))
                                  .toList(),
                              onChanged: (ite) {
                                setState(() {
                                  selected = ite;
                                });
                              }),
                        ),
                        DropdownButton(
                            hint: Text('Select ml'),
                            value: ml_select,
                            items: list_ml
                                .map((ite) => DropdownMenuItem<int>(
                                   alignment: AlignmentDirectional.center,
                                    value: ite, child: Text(ite.toString())))
                                .toList(),
                            onChanged: (ite) {
                              setState(() {
                                ml_select = ite;
                              });
                            }),
                        ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                edited_liter = selected;
                                ml = 0;
                                value = 0;
                                selected = selected;
                              });
                              await setlit.set_val_lit(selected);
                              await useml.setml(0);
                              await userpreferences.setvalue(0);
                            },
                            child: Text('set'))
                      ],
                    ),
                     Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('⚠ On tap set all values will reinitalize to 0' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
              ),
                  ],
                ),
              ),
            ),
//       ),
            //     Row(
            //       children: [
            //   Center(
            //     child: DropdownButton(
            //         hint: const Text('Select liters'),
            //         value: selected,
            //         items: item
            //             .map((ite) => DropdownMenuItem<int>(
            //                 value: ite, child: Text(ite.toString())))
            //             .toList(),
            //         onChanged: (ite) {
            //           setState(() {
            //             selected = ite;
            //           });
            //         }),
            //   ),
            //   Center(
            //     child: DropdownButton(
            //         hint: const Text('Select ml'),
            //         value: ml_select,
            //         items: ml
            //             .map((ite) => DropdownMenuItem<int>(
            //                 value: ite, child: Text(ite.toString())))
            //             .toList(),
            //         onChanged: (ite) {
            //           setState(() {
            //             ml_select = ite;
            //           });
            //         }),
            //   ),
            //   ElevatedButton(
            //       onPressed: () async {
            //         setState(() {
            //           print(selected);
            //           print(ml_select);
            //           homepage.liters.value = selected;
            //           homepage.ml.value = ml_select;
            //         });
            //         await setlit.set_val_lit(selected);
            //       },
            //       child: const Text('set the value'))
            // ],
            //     ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(top: 10, bottom: 10),
            //       child: Center(
            //         child: Container(
            //           width: MediaQuery.of(context).size.width * 0.7,
            //           height: 40,
            //           decoration: BoxDecoration(
            //               color: Colors.blue,
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Center(
            //               child: Text(
            //             "Liters : ${homepage.liters.value}  |  ML : ${homepage.ml.value}",
            //             style: TextStyle(
            //                 color: Colors.white, fontWeight: FontWeight.bold),
            //           )),
            //         ),
            //       ),
            //     ),
            //     // IconButton(
            //     //     onPressed: () {
            //     //       Get.to(() => const edit());
            //     //     },
            //     //     color: Colors.blue,
            //     //     icon: Icon(Icons.edit))
            //   ],
            // ),
           
            SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }
}

class setlit {
  static late SharedPreferences _setlitprefer;
  static const _setlitkey = 'setlit';
  static Future init() async =>
      _setlitprefer = await SharedPreferences.getInstance();
  static Future set_val_lit(int setlit) async =>
      await _setlitprefer.setInt(_setlitkey, setlit);
  static int? get_val_lit() => _setlitprefer.getInt(_setlitkey);
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
