import 'package:aqua_up/mainscreen/homepage.dart';
import 'package:aqua_up/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  late int mlperday = 0;
  late int litperday = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        children: [
          SizedBox(height: 200, child: Image.asset('assets/save.png')),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Text(
                "No.of ml you drink today",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              ),
            ),
          ),
          LinearPercentIndicator(
            // center: Text(ml),
            animation: true,
            animationDuration: 1000,
            barRadius: const Radius.circular(50),
            lineHeight: 20.0,
            percent: 0.5,
            backgroundColor: const Color.fromARGB(255, 198, 198, 198),
            progressColor: Colors.blue,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Text(
                "Number of ml per double tap",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        mlperday = mlperday - 100;
                        Get.put(homepage(deflit: mlperday, defml: litperday));
                       // homepage(defml: mlperday, deflit: litperday);
                      });
                    },
                  ),
                ),
                Text(
                  "    $mlperday     ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.keyboard_double_arrow_up_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        mlperday = mlperday + 100;
                        homepage(defml: mlperday, deflit: litperday);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                "Number of liters per day",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        litperday = litperday - 1;
                        homepage(defml: mlperday, deflit: litperday);
                      });
                    },
                  ),
                ),
                Text(
                  "      $litperday       ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.keyboard_double_arrow_up_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        litperday = litperday + 1;
                        homepage(defml: mlperday, deflit: litperday);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 40, 10, 0), child: slider()),
         Padding(
           padding: const EdgeInsets.fromLTRB(10.0, 30, 10, 0),
           child: ElevatedButton(
                  onPressed: () {
                    Get.changeTheme(
                        Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  },
                  child: Text("Change Theme")),
         )
        ],
      ),
    );
  }
}
