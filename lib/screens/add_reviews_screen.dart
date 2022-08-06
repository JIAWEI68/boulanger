import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/reviews_list.dart';
import 'package:recipes_app/models/users.dart';
import 'package:recipes_app/providers/users_providers.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../models/reviews.dart';

class AddReviewsScreen extends StatefulWidget {
  static String routeName = '/add-reviews';
  String recipeName;
  String userId;
  AddReviewsScreen({Key? key, required this.recipeName, required this.userId})
      : super(key: key);

  @override
  State<AddReviewsScreen> createState() => _AddReviewsScreenState();
}

class _AddReviewsScreenState extends State<AddReviewsScreen> {
  FirestoreService firestoreService = FirestoreService();
  var form = GlobalKey<FormState>();
  late final Reviews reviews;
  String? username;
  String? id;
  String? description;
  String? imageUrl;
  void addReview(ReviewsProvider reviewsList) {
    //to check whether the textfield is empty or not
    //when the text field is not empty, the values from all the text fields will be added into the reviews list
    //which will be shown in the list view and the reviews screen
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(username);
      print(description);
      firestoreService.addReview(
        widget.recipeName,
        username,
        description,
        imageUrl,
        widget.userId,
      );
      // reviewsList.addReview(
      //   Reviews(
      //     id: id,
      //     recipeName: widget.recipeName,
      //     username: username,
      //     description: description,
      //     imageUrl: imageUrl,
      //   ),
      // );
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
    final user = FirebaseAuth.instance.currentUser!;
    List<Users> userList = [];
    ReviewsProvider reviewsList = Provider.of<ReviewsProvider>(context);
    return Consumer(
      builder: (BuildContext context, UserProvider provider, Widget? child) {
        userList = provider.userList
            .where((element) => element.email == user.email)
            .toList();
        imageUrl = userList[0].imageUrl;
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
                      username = userList[0].username;
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
                      child: Text("Add Reviews",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      onPressed: () {
                        addReview(reviewsList);
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
