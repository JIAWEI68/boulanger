import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueGrey),
        backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '''Enter your email and we will send 
 the reset link to you''',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: SizedBox(
              width: 320,
              child: TextFormField(
                controller: emailController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true),
                validator: (value) {
                  if (value == "") {
                    return "Please enter a username";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: Size(200, 55),
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  passwordReset();
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Color.fromRGBO(251, 170, 28, 10),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
