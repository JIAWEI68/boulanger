import 'package:flutter/material.dart';
import 'package:recipes_app/screens/login_screen.dart';
import 'package:recipes_app/screens/sign_up_screen.dart';

class LoginAndSignUpScreen extends StatelessWidget {
  const LoginAndSignUpScreen({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100,
            ),
            ElevatedButton(
              onPressed: () {
                goToRegister(context);
              },
              child: const Text("Sign Up"),
            ),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                goToLogin(context);
              },
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
