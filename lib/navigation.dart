import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aqua_up/dimensions.dart';
import 'package:aqua_up/main.dart';
import 'package:aqua_up/mainscreen/homepage.dart';
import 'package:aqua_up/slider.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'mainscreen/facts.dart';

class navigation extends StatefulWidget {
  const navigation();
  // late double val;
  // navigation({required this.val});
  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  // late double val;
  // _navigationState(this.val);
  String timeOfDayText = '';
  @override
  void initState() {
    super.initState();
    // getAffirmation();
    DateTime nowTime = DateTime.now();
    int hours = nowTime.hour;
    if (hours >= 5 && hours < 12) {
      timeOfDayText = "Good Morning";
    } else if (hours >= 12 && hours < 17) {
      timeOfDayText = "Good Afternoon";
    } else {
      timeOfDayText = "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: timeOfDayText == "Good Morning"
            ? const Color.fromARGB(255, 1, 54, 106)
            : timeOfDayText == "Good Afternoon"
                ? const Color.fromARGB(255, 13, 7, 8)
                : const Color.fromARGB(255, 54, 57, 98),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 200,
                width: screenWidth(context),
                child: Image.asset(
                  timeOfDayText == "Good Morning"
                      ? 'assets/morning.jpg'
                      : timeOfDayText == "Good Afternoon"
                          ? 'assets/after.jpg'
                          : 'assets/eve.jpg',
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "$timeOfDayText :)",
                style: const TextStyle(
                    color: Color.fromARGB(138, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Aqua Team",
                style: TextStyle(
                    color: Color.fromARGB(164, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const facts());
                      },
                      child: Container(
                        height: 110,
                        width: 100,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 15,
                              cornerSmoothing: 1,
                            ),
                          ),
                        ),
                        child: Image.asset('assets/facts.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 110,
                      width: 100,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 15,
                            cornerSmoothing: 1,
                          ),
                        ),
                      ),
                      child: Image.asset('assets/track_data.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  width: 60,
                  child: FAProgressBar(
                    size: 40,
                    maxValue: 150,
                    progressColor: const Color.fromARGB(255, 71, 136, 199),
                    backgroundColor: Colors.white,
                    currentValue: 100,
                    animatedDuration: const Duration(milliseconds: 800),
                    direction: Axis.vertical,
                    verticalDirection: VerticalDirection.up,
                  ),
                )
              ],
            ),
            // const Center(
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
            //     child: Text(
            //       "No.of ml you drink today",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           fontFamily: 'Poppins',
            //           fontSize: 16),
            //     ),
            //   ),
            // ),
            // LinearPercentIndicator(
            //   // center: Text(ml),
            //   animation: true,
            //   animationDuration: 1000,
            //   barRadius: const Radius.circular(50),
            //   lineHeight: 20.0,
            //   percent: 0.5,
            //   backgroundColor: const Color.fromARGB(255, 198, 198, 198),
            //   progressColor: Colors.blue,
            // ),
            // const Center(
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
            //     child: Text(
            //       "Number of ml per double tap",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           fontFamily: 'Poppins',
            //           fontSize: 16),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CircleAvatar(
            //         backgroundColor: Colors.blue,
            //         radius: 20,
            //         child: IconButton(
            //           padding: EdgeInsets.zero,
            //           icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
            //           color: Colors.white,
            //           onPressed: () async {
            //             setState(() async {
            //               if (mlperday > 0) {
            //                 mlperday = mlperday - 100;
            //                 await dbref.set({
            //                   'def_ml': mlperday.toString(),
            //                   'def_lit': litperday.toString(),
            //                 });
            //                 Get.put(homepage(
            //                     deflit: mlperday, defml: litperday.toInt()));
            //               }
            //               // homepage(defml: mlperday, deflit: litperday);
            //             });
            //           },
            //         ),
            //       ),
            //       Text(
            //         "    $mlperday     ",
            //         style: const TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontFamily: 'Poppins',
            //             fontSize: 16),
            //       ),
            //       CircleAvatar(
            //         backgroundColor: Colors.blue,
            //         radius: 20,
            //         child: IconButton(
            //           padding: EdgeInsets.zero,
            //           icon: const Icon(Icons.keyboard_double_arrow_up_rounded),
            //           color: Colors.white,
            //           onPressed: () {
            //             read_data();
            //             setState(() async {
            //               mlperday = mlperday + 100;
            //               await dbref.set({
            //                 'def_ml': mlperday,
            //                 'def_lit': litperday,
            //               });
            //               homepage(defml: mlperday, deflit: litperday.toInt());
            //             });
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Center(
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            //     child: Text(
            //       "Number of liters per day",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           fontFamily: 'Poppins',
            //           fontSize: 16),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CircleAvatar(
            //         backgroundColor: Colors.blue,
            //         radius: 20,
            //         child: IconButton(
            //           padding: EdgeInsets.zero,
            //           icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
            //           color: Colors.white,
            //           onPressed: () {
            //             litperday = 10;
            //             setState(() {
            //               litperday = litperday - 1;
            //               homepage(defml: mlperday, deflit: litperday.toInt());
            //             });
            //           },
            //         ),
            //       ),
            //       Text(
            //         "      $litperday       ",
            //         style: const TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontFamily: 'Poppins',
            //             fontSize: 16),
            //       ),
            //       CircleAvatar(
            //         backgroundColor: Colors.blue,
            //         radius: 20,
            //         child: IconButton(
            //           padding: EdgeInsets.zero,
            //           icon: const Icon(Icons.keyboard_double_arrow_up_rounded),
            //           color: Colors.white,
            //           onPressed: () {
            //             setState(() {
            //               litperday = litperday + 1;
            //               homepage(defml: mlperday, deflit: litperday.toInt());
            //             });
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Padding(
            //     padding: EdgeInsets.fromLTRB(10.0, 40, 10, 0), child: slider()),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10.0, 30, 10, 0),
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Get.changeTheme(
            //             Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            //       },
            //       child: Text("Change Theme")),
            // )
            Spacer(),
            TextLiquidFill(
              boxHeight: 90.0,
              loadUntil: 0.6,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              boxBackgroundColor: Color.fromARGB(255, 4, 100, 196),
              text: 'Stay Hydrated',
              waveColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
