import 'package:aqua_up/dimensions.dart';
import 'package:aqua_up/mainscreen/facts.dart';
import 'package:aqua_up/mainscreen/info.dart';
import 'package:aqua_up/navigation.dart';
import 'package:aqua_up/profile/profile.dart';
import 'package:confetti/confetti.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:circular_usage_indicator/circular_usage_indicator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class homepage extends StatefulWidget {
  late int defml;
  late int deflit;
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;
  homepage({
    super.key,
    // required this.analytics,
    // required this.observer,
  });
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //TODO: This is the data

  double value = 0;
  int ml = 0;
  int edited_liter = 4;
  int edited_ml = 100;
  dynamic selected = setlit.get_val_lit() ?? 4;
  dynamic selected1 = useml.getvalue() ?? 100;
  // int edited_ml = 100;
  List<int> list_item = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> list_ml = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final controller = ConfettiController();
//! This is for the analytics
  dynamic daily_ml_counter = 0;

  // late FirebaseAnalytics analytics;
  // late FirebaseAnalyticsObserver observer;
  _homepageState();

  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  // Future<void> _sendanlytics() async {
  //   await widget.analytics.logEvent(
  //     name: 'facts_page',
  //     parameters: <String, dynamic>{},
  //   );
  //   setMessage('logEvent succeeded');
  // }

  // Future<void> _sendinfo() async {
  //   await widget.analytics.logEvent(
  //     name: 'water_update',
  //     parameters: <String, dynamic>{},
  //   );
  //   setMessage('logEvent succeeded');
  // }
  dynamic weekdays = {
    1: "Monday",
    2: "Tuesday",
    3: "Wensday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  };
  String reference_day = "Monday";

  //! This is for the analytics
  @override
  void initState() {
    super.initState();
    String todays_day = weekdays[DateTime.now().weekday];
    bool istoday = true ? todays_day == reference_day : false;
    value = userpreferences.getvalue() ?? 0;
    edited_ml = useml.getvalue() ?? 100;
    edited_liter = setlit.get_val_lit() ?? 4;
  }

  // bool isplaying = false;
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        drawer: const navigation(),
        body: Builder(builder: (context) {
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu)),
                    GestureDetector(
                        onTap: () async {
                          // _sendanlytics();
                          print(daily_ml_counter);
                          Get.to(() => const facts());
                        },
                        child: SizedBox(
                            height: 60,
                            child: Image.asset('assets/mainl.png'))),
                    // IconButton(
                    //     onPressed: () {
                    //       Get.to(() => const info());o
                    //       // Get.to(() => insert());
                    //     },
                    //     icon: const Icon(Icons.info_outline))
                    GestureDetector(
                      onTap: () {
                        //  Get.to(() => const profile());
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 500),
                                reverseDuration:
                                    const Duration(milliseconds: 500),
                                child: const profile()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8), // Border width
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(20), // Image radius
                            child: FadeInImage.assetNetwork(
                                placeholder: 'assets/profile.png',
                                image:
                                    'https://www.telugu360.com/wp-content/uploads/2020/03/Samantha-18.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      // child: const ProfilePicture(
                      //   name: 'Manohar',
                      //   radius: 20,
                      //   fontsize: 21,
                      //   img:
                      //       'https://www.telugu360.com/wp-content/uploads/2020/03/Samantha-18.jpg',
                      // ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // RichText(
              //   text: const TextSpan(
              //       text: 'Good Morning  ( • ᴗ - )  ',
              //       style: TextStyle(color: Color.fromARGB(100, 0, 0, 0) , fontSize: 20 , fontWeight: FontWeight.bold),
              //        children: [TextSpan(text: 'Manohar' , style: TextStyle(color: Color.fromARGB(128, 33, 149, 243)))]),
              // ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Lottie.asset('assets/lottie.json')),
              GestureDetector(
                onDoubleTap: () async {
                  // _sendinfo();
                  setState(() {
                    if (value < 1.0) {
                      ml = ml + edited_ml;
                      value = ml / (edited_liter * 1000);
                      daily_ml_counter = daily_ml_counter + edited_ml;
                      print(ml);
                      print(edited_ml);
                      print(edited_liter);
                    } else {
                      controller.play();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: const EdgeInsets.all(15),
                              shape: SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius(
                                  cornerRadius: 30,
                                  cornerSmoothing: 1,
                                ),
                              ),
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
                  await useml.setml(edited_ml);
                  await userpreferences.setvalue(value);
                },
                onLongPress: () async {
                  setState(() {
                    if (value > 0) {
                      ml = ml - edited_ml;
                      value = ml / (edited_liter * 1000);
                      daily_ml_counter = daily_ml_counter - edited_ml;
                    }
                  });
                  await useml.setml(edited_ml);
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
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 240,
                  decoration: ShapeDecoration(
                    color: Colors.blue,
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 20,
                        cornerSmoothing: 1,
                      ),
                    ),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' Update Gesture values',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                // child: TextButton.icon(
                //   icon: const Icon(Icons.edit),
                //   label: const Text(' Update Gesture values'),
                //   style: TextButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //     foregroundColor: Colors.white,
                //     fixedSize: const Size(250, 40),
                //     shape: const RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //     ),
                //   ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return Dialog(
                            insetPadding: const EdgeInsets.all(20),
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 15,
                                cornerSmoothing: 1,
                              ),
                            ),
                            child: SizedBox(
                              height: 350,
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(30),
                              //     color: Colors.white),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const ShapeDecoration(
                                      color: Colors.blue,
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius.only(
                                            topLeft: SmoothRadius(
                                                cornerRadius: 15,
                                                cornerSmoothing: 1),
                                            topRight: SmoothRadius(
                                                cornerRadius: 15,
                                                cornerSmoothing: 1)
                                            // cornerRadius: 15,
                                            // cornerSmoothing: 1,
                                            ),
                                      ),
                                    ),
                                    height: 40,
                                    width: screenWidth(context),
                                    child: const Center(
                                        child: Text(
                                      "Update Gesture Values",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  // const SizedBox(
                                  //   height: 15,
                                  // ),
                                  // SizedBox(
                                  //   height: 60,
                                  //   child: Image.asset('assets/edit.png'),
                                  // ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      height: 45,
                                      decoration: ShapeDecoration(
                                        color: Colors.blue,
                                        shape: SmoothRectangleBorder(
                                          borderRadius: SmoothBorderRadius(
                                            cornerRadius: 20,
                                            cornerSmoothing: 1,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'liters per day',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            DropdownButton(
                                                hint: const Text('hint'),
                                                value: selected !=
                                                        setlit.get_val_lit()
                                                    ? selected
                                                    : setlit.get_val_lit(),
                                                items: list_item
                                                    .map((ite) => DropdownMenuItem<
                                                            int>(
                                                        alignment:
                                                            AlignmentDirectional
                                                                .center,
                                                        value: ite,
                                                        child: Text(
                                                            ite.toString())))
                                                    .toList(),
                                                onChanged: (ite) {
                                                  setState(() {
                                                    selected = ite;
                                                    print(selected);
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: Container(
                                      height: 45,
                                      decoration: ShapeDecoration(
                                        color: Colors.blue,
                                        shape: SmoothRectangleBorder(
                                          borderRadius: SmoothBorderRadius(
                                            cornerRadius: 20,
                                            cornerSmoothing: 1,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ml per tap',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            DropdownButton(
                                                hint: const Text('hint'),
                                                value: selected1 !=
                                                        useml.getvalue()
                                                    ? selected1
                                                    : useml.getvalue(),
                                                items: list_ml
                                                    .map((items) =>
                                                        DropdownMenuItem<int>(
                                                            alignment:
                                                                AlignmentDirectional
                                                                    .center,
                                                            value: items,
                                                            child: Text(items
                                                                .toString())))
                                                    .toList(),
                                                onChanged: (item) {
                                                  setState(() {
                                                    selected1 = item;
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // ElevatedButton(
                                  //     onPressed: () async {
                                  //       setState(() {
                                  //         edited_liter = selected;
                                  //         ml = 0;
                                  //         value = 0;
                                  //         selected = selected;
                                  //       });
                                  //       await setlit.set_val_lit(selected);
                                  //       await useml.setml(0);
                                  //       await userpreferences.setvalue(0);
                                  //       Navigator.pop(context);
                                  //     },
                                  //     child: const Text('Update')),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        edited_liter = selected;
                                        edited_ml = selected1;
                                        ml = 0;
                                        value = 0;
                                        // selected = selected;
                                      });
                                      await setlit.set_val_lit(selected);
                                      await useml.setml(selected1);
                                      await userpreferences.setvalue(0);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 150,
                                      decoration: ShapeDecoration(
                                        color: Colors.blue,
                                        shape: SmoothRectangleBorder(
                                          borderRadius: SmoothBorderRadius(
                                            cornerRadius: 20,
                                            cornerSmoothing: 1,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.update_outlined,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'Update',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '⚠ On tap set all values will reinitalize to 0',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      });
                },
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 10 , right: 10),
              //   child: Container(
              //     height: 120,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       color: Colors.blue              ),
              //     child: Column(
              //       children: [
              //         SizedBox(height: 15,),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             SizedBox(
              //               width: 120,
              //               child: DropdownButton(
              //                   hint: Text('Select liters'),
              //                   value: selected != setlit.get_val_lit() ? selected : setlit.get_val_lit(),
              //                   items: list_item
              //                       .map((ite) => DropdownMenuItem<int>(
              //                          alignment: AlignmentDirectional.center,
              //                           value: ite, child: Text(ite.toString())))
              //                       .toList(),
              //                   onChanged: (ite) {
              //                     setState(() {
              //                       selected = ite;
              //                     });
              //                   }),
              //             ),
              //             DropdownButton(
              //                 hint: Text('Select ml'),
              //                 value: ml_select,
              //                 items: list_ml
              //                     .map((ite) => DropdownMenuItem<int>(
              //                        alignment: AlignmentDirectional.center,
              //                         value: ite, child: Text(ite.toString())))
              //                     .toList(),
              //                 onChanged: (ite) {
              //                   setState(() {
              //                     ml_select = ite;
              //                   });
              //                 }),
              //             ElevatedButton(
              //                 onPressed: () async {
              //                   setState(() {
              //                     edited_liter = selected;
              //                     ml = 0;
              //                     value = 0;
              //                     selected = selected;
              //                   });
              //                   await setlit.set_val_lit(selected);
              //                   await useml.setml(0);
              //                   await userpreferences.setvalue(0);
              //                 },
              //                 child: Text('set'))
              //           ],
              //         ),
              //          Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text('⚠ On tap set all values will reinitalize to 0' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
              //   ),
              //       ],
              //     ),
              //   ),
              // ),
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

              const SizedBox(
                height: 20,
              ),
            ],
          );
        }),
      ),
      // ConfettiWidget(
      //   confettiController: controller,
      // )
    ]);
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
