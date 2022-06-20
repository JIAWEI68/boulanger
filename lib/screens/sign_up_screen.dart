import 'package:flutter/material.dart';
import 'package:recipes_app/main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  var form = GlobalKey<FormState>();
  String? username;
  String? password;
  void login() {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(username);
      print(password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Successful'),
      ));
      form.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueGrey),
        backgroundColor: Color.fromRGBO(254, 238, 210, 10),
      ),
      body: Container(
        child: Form(
          key: form,
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Username',
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
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true),
                  validator: (value) {
                    if (value == "") {
                      return "Please enter a password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
