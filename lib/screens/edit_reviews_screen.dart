import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/reviews_list.dart';
import 'package:recipes_app/models/reviews.dart';
import 'package:recipes_app/providers/users_providers.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../models/users.dart';

class EditReviewsScreen extends StatefulWidget {
  Reviews reviewsUsername;
  String recipeName;
  final Users users;
  static String routeName = '/add-reviews';
  EditReviewsScreen(
      {Key? key,
      required this.reviewsUsername,
      required this.recipeName,
      required this.users})
      : super(key: key);
  static void goToEditScreen(
      BuildContext context, Reviews reviews, String recipeName, Users users) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditReviewsScreen(
                  reviewsUsername: reviews,
                  recipeName: recipeName,
                  users: users,
                )));
  }

  @override
  State<EditReviewsScreen> createState() => _EditReviewsScreenState();
}

class _EditReviewsScreenState extends State<EditReviewsScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  var form = GlobalKey<FormState>();
  FirestoreService firestoreService = FirestoreService();
  String? username;
  String? id;
  String? description;
  List<Users> userList = [];
  void editReviews(String id, String username) {
    //to check whether the textfield is empty or not
    //when the text field is not empty, the values from all the text fields will be added into the reviews list
    //which will be shown in the list view and the reviews screen
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(username);
      print(description);
      firestoreService.editReviews(
          id, widget.recipeName, username, description, widget.users.imageUrl);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Reviews added successfully!'),
      ));
      form.currentState!.reset();
      Navigator.pop(context);
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    ReviewsProvider reviewsList = Provider.of<ReviewsProvider>(context);
    return Consumer(
      builder:
          (BuildContext context, UserProvider userProvider, Widget? child) {
        userList = userProvider.userList
            .where((element) => element.email == user.email)
            .toList();
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.blueGrey),
            backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: form,
              child: Column(
                children: [
                  TextFormField(
                    enabled: false,
                    initialValue: userList[0].username,
                    decoration: InputDecoration(label: Text('Username')),
                    validator: (value) {
                      if (value == "") {
                        return "Please enter a username";
                      } else {
                        return null;
                      }
                    },
                    //the text field data will be set into  the param string username
                    //this will then be added into the reviews list
                    //this is the same for the other text field
                    onSaved: (value) {
                      username = widget.reviewsUsername.username;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Description')),
                    validator: (value) {
                      if (value == "") {
                        return "Please enter a description";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      description = value as String;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text("Edit Reviews",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      onPressed: () {
                        editReviews(
                            widget.reviewsUsername.id, userList[0].username);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
