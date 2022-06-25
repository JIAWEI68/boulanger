import 'package:flutter/material.dart';
import 'package:recipes_app/screens/login_screen.dart';
import 'package:recipes_app/screens/sign_up_screen.dart';

class LoginAndSignUpScreen extends StatelessWidget {
  const LoginAndSignUpScreen({Key? key}) : super(key: key);
//this screen is to ask users to login or sign up
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueGrey),
        backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset("images/profile_icon.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: SizedBox(
                height: 62,
                width: 260,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: Size(173, 68),
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    goToRegister(context);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black, fontSize: 23, fontFamily: "Segoe"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 62,
                width: 260,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: Size(173, 68),
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black, fontSize: 23, fontFamily: "Segoe"),
                  ),
                  onPressed: () {
                    goToLogin(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void goToLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void goToRegister(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }
}
