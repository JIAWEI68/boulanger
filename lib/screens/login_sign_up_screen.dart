import 'package:flutter/material.dart';
import 'package:recipes_app/screens/login_screen.dart';

class LoginAndSignUpScreen extends StatelessWidget {
  const LoginAndSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Icon(Icons.account_circle), ElevatedButton(onPressed: () {}, child: const Text("Sign Up"), ), ElevatedButton(child: Text("Login"), onPressed: (){},)],
        ),
      ),
    );
  }
  void goToLogin(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>   const LoginScreen()));
  }
}
