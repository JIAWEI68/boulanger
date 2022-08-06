import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../login_main.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpScreen({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  FirestoreService firestoreService = FirestoreService();
  @override
  var form = GlobalKey<FormState>();
  String? username;
  String imageUrl = "";
  String? firstName;
  String? lastName;
  void register() {
    //this is to check if the text field has been all filled up
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(username);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginMainScreen()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Register Successful'),
      ));
      form.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      firestoreService.addUser(username, firstName, lastName,
          emailController.text.trim(), passwordController.text.trim());
    }
  }

  bool passwordConfirm() {
    if (passwordController.text == confirmPasswordController.text) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Container(
          alignment: Alignment.center,
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Image.asset("images/profile_icon.png")),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                  ),
                  child: SizedBox(
                    width: 320,
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
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                  ),
                  child: SizedBox(
                    width: 320,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'First Name',
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
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                  ),
                  child: SizedBox(
                    width: 320,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Last Name',
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
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
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
                          return "Please enter a email";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: 320,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: 320,
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true),
                      validator: (confirmPassword) {
                        if (confirmPasswordController.text == "") {
                          return "Please enter a password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.5),
                  child: GestureDetector(
                    child: TextButton(
                      child: Text("Login"),
                      onPressed: () {
                        widget.showLoginPage();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          fixedSize: Size(173, 68),
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        signUp();
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Color.fromRGBO(251, 170, 28, 10),
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
