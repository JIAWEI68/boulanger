import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/auth/auth_page.dart';
import 'package:recipes_app/main.dart';

class MainScreenCheck extends StatefulWidget {
  static String routeName = "/main";
  @override
  State<MainScreenCheck> createState() => _MainScreenCheckState();
}

class _MainScreenCheckState extends State<MainScreenCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set the body the with the screens as widgets
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
