import 'package:flutter/material.dart';

class LoginAndSignUpScreen extends StatelessWidget {
  const LoginAndSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [Icon(Icons.account_circle), ElevatedButton(onPressed: () {}, child: const Text("Sign Up"), ), ElevatedButton(child: Text("Login"), onPressed: (){},)],
        ),
      ),
    );
  }
}
