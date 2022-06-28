import 'package:flutter/material.dart';
import 'package:recipes_app/models/reviews.dart';

class AllReviews with ChangeNotifier {
  int selectedIndex = 0;
  List<Reviews> reviewsList = [];
  List<Reviews> getReviews() {
    return reviewsList;
  }

  void addReviews(recipeName, username, description) {
    reviewsList.insert(
      0,
      Reviews(recipeName : recipeName ,username: username, description: description),
    );
    notifyListeners();
  }

  void removeReviews(i) {
    reviewsList.removeAt(i);
    notifyListeners();
  }
  void editReviews(Reviews reviews){
    print(reviewsList.indexWhere((element) => element.description == reviews.description));
   reviewsList[reviewsList.indexWhere((element) => element.username == reviews.username)] = reviews;
   notifyListeners();
  }
}
