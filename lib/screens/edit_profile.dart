import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/users_providers.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../models/users.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  FirestoreService firestoreService = FirestoreService();
  var form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? username;
  String? imageUrl;
  String? firstName;
  String? lastName;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Consumer(
      builder: (BuildContext context, UserProvider provider, Widget? child) {
        List<Users> userList = provider.userList
            .where((element) => element.email == user.email)
            .toList();
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.blueGrey),
            backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
          ),
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
                          initialValue: userList[0].imageUrl,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true),
                          validator: (value) {
                            if (value == "") {
                              return "Please enter a image link";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              imageUrl = value;
                            });
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
                              fixedSize: Size(173, 68),
                              side: BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            firestoreService.editProfile(
                                userList[0].id, imageUrl);
                          },
                          child: Text(
                            "Upload",
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
      },
    );
  }
}
