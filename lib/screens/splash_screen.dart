import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipes_app/auth/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//this is the screen when the app just launches showing a short time of a screen
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //this is to set the time the screen shows when the app is launched
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MainScreenCheck())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(254, 238, 210, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/cooking.png",
              height: 168.0,
              width: 168.0,
            ),
            const Text(
              "boulanger",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Georgia', fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
