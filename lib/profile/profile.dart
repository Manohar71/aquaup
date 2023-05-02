import 'package:aqua_up/auth/sign_in.dart';
import 'package:aqua_up/dimensions.dart';
import 'package:aqua_up/profile/Cutsomshape.dart';
import 'package:aqua_up/profile/widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            child: Stack(children: [
              ClipPath(
                clipper: Customshape(),
                child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                top: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: screenWidth(context) * 0.7,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Center(
                    child: Container(
                  padding: EdgeInsets.all(8), // Border width
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: Image.network(
                          'https://www.telugu360.com/wp-content/uploads/2020/03/Samantha-18.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                )),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 25,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Samantha Ruth Prabhu",
                  style: TextStyle(
                      color: Color.fromARGB(165, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.mail,
                  size: 25,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Samantha_notty@gmail.com",
                  style: TextStyle(
                      color: Color.fromARGB(165, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.phone_android,
                  size: 25,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "1234567890",
                  style: TextStyle(
                      color: Color.fromARGB(165, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 25,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "11-08-2002",
                  style: TextStyle(
                      color: Color.fromARGB(165, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                profile_button(context, true, () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 15,
                              cornerSmoothing: 1,
                            ),
                          ),
                          child: SizedBox(
                            height: 130,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Are you sure you want to exit ?",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    profile_button(context, true, () {
                                      FirebaseAuth.instance
                                          .signOut()
                                          .then((value) async {
                                        await login.set_login(false);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    sign_in()));
                                      });
                                    }),
                                    profile_button(context, false, () {
                                      Navigator.of(context).pop();
                                    }),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
