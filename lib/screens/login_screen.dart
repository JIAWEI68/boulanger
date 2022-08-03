import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/login_main.dart';
import 'package:recipes_app/screens/forget_password.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginScreen({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
          context, MaterialPageRoute(builder: (context) => LoginMainScreen()));
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80),
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
                    top: 45.0,
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
                  padding: EdgeInsets.only(top: 0.5, left: 200.0),
                  child: TextButton(
                    child: Text("Forget Password"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.5),
                  child: GestureDetector(
                    child: TextButton(
                      child: Text("Register Now"),
                      onPressed: () {
                        widget.showRegisterPage();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          fixedSize: Size(173, 68),
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        signIn();
                      },
                      child: Text(
                        "Login",
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
