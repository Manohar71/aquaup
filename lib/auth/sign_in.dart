import 'package:aqua_up/auth/loading.dart';
import 'package:aqua_up/auth/widgets.dart';
import 'package:aqua_up/mainscreen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../mainscreen/facts.dart';

class sign_in extends StatefulWidget {
  const sign_in();

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool loading = false;
  bool login_val = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login_val = login.get_login() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? loader()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    child: Image.asset("assets/slogo.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      "Welcome , Enter Your Email and Password to Login",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(123, 0, 0, 0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Resuabletextfeild(
                        "Enter Username", Icons.mail, false, _emailcontroller),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Resuabletextfeild("Enter Password", Icons.lock, true,
                        _passwordcontroller),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  auth_button(context, true, () {
                    setState(() {
                      loading = true;
                    });
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text)
                        .then((value) async {
                      setState(() {
                        loading = false;
                      });
                      await login.set_login(true);
                      Get.to(() => homepage());
                    }).onError((error, stackTrace) {
                      print("error ${error.toString()}");
                    });
                  }),
                  SizedBox(
                    height: 40,
                  ),
                  Center(child: gotoSignup(context))
                ],
              ),
            ),
          );
  }
}

class login {
  static late SharedPreferences setlogin;
  static const loginkey = 'login';
  static Future init() async =>
      setlogin = await SharedPreferences.getInstance();
  static Future set_login(bool val) async =>
      await setlogin.setBool(loginkey, val);
  static bool? get_login() => setlogin.getBool(loginkey);
}
