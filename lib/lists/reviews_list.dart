import 'package:flutter/material.dart';
import 'package:recipes_app/models/reviews.dart';

class AllReviews with ChangeNotifier {
  List<Reviews> reviewsList = [];

  List<Reviews> getReviews() {
    return reviewsList;
  }

  void addReviews(username, description) {
    reviewsList.insert(
      0,
      Reviews(username: username, description: description),
    );
    notifyListeners();
  }

  void removeReviews(i) {
    reviewsList.removeAt(i);
    notifyListeners();
  }
}
