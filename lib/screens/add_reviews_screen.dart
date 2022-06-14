import 'package:flutter/material.dart';

class AddReviewsScreen extends StatefulWidget {
  static String routeName = '/add-reviews';

  AddReviewsScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewsScreen> createState() => _AddReviewsScreenState();
}

class _AddReviewsScreenState extends State<AddReviewsScreen> {
  var form = GlobalKey<FormState>();

  String? username;

  String? description;

  void addReview() {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(username);
      print(description);
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: addReview,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Username')),
                validator: (value) {
                  if (value == "") {
                    return "Please enter a username";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  username = value as String;
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
                  description = value;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
