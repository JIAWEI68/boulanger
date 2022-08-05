import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/reviews.dart';

class ReviewsProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<Reviews> reviewsList = [];
  List<Reviews> getReviews() {
    return reviewsList;
  }

  // void addReviews(recipeName, username, description, id) {
  //   reviewsList.insert(
  //     0,
  //     Reviews(
  //         recipeName: recipeName,
  //         username: username,
  //         description: description,
  //         id: id),
  //   );
  //   notifyListeners();
  // }

  //remove the reviews based on the index in the list
  void removeReviews(i) {
    reviewsList.removeAt(i);
    notifyListeners();
  }

  void editReviews(Reviews reviews) {
    //prints the index of the list based on the username
    print(reviewsList
        .indexWhere((element) => element.username == reviews.username));
    //checks the index of the list based on the username
    //replaces the value of the list with the new value in that index
    reviewsList[reviewsList.indexWhere(
        (element) => element.username == reviews.username)] = reviews;
    notifyListeners();
  }

  ReviewsProvider() {
    FirebaseFirestore.instance
        .collection("reviews")
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        Reviews reviews = Reviews.fromMap(change.doc.data()!, change.doc.id);
        print(change.doc.data());
        switch (change.type) {
          case DocumentChangeType.added:
            reviewsList.add(reviews);
            break;
          case DocumentChangeType.modified:
            reviewsList.removeWhere((element) => element.id == reviews.id);
            reviewsList.add(reviews);
            // TODO: Handle this case.
            break;
          case DocumentChangeType.removed:
            reviewsList.removeWhere((element) => element.id == reviews.id);
            // TODO: Handle this case.
            break;
        }
      }
    });
  }
}
