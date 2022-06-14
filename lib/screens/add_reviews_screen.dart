import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/reviews_list.dart';

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

  void addReview(AllReviews reviewsList) {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(username);
      print(description);
      reviewsList.addReviews(username, description);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Reviews added sucessfully!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please add a username or description'),
      ));
    }
    FocusScope.of(context).unfocus();
    form.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    AllReviews reviewsList = Provider.of<AllReviews>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              addReview(reviewsList);
            },
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
