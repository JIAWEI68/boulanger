import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipes_app/models/recipe.dart';

class FavouriteProvider with ChangeNotifier {
  List<Recipe> favourtieList = [];
  List<Recipe> getFavourtieList() {
    return favourtieList;
  }

  void addToFavourite(Recipe recipe) {
    favourtieList.insert(0, recipe);
    notifyListeners();
  }

  //remove the item in the list based on the item recipe and not the index
  void removeFavourite(Recipe recipe) {
    favourtieList.remove(recipe);
    notifyListeners();
  }

//allow the favourite list to be filtered based on this string when the value is changed
  String searchString = "";
  FavouriteProvider() {
    FirebaseFirestore.instance
        .collection("favourites")
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        Recipe recipe = Recipe.fromMap(change.doc.data()!, change.doc.id);
        print(change.doc.data());
        print(recipe.id);
        switch (change.type) {
          case DocumentChangeType.added:
            favourtieList.add(recipe);
            break;
          case DocumentChangeType.modified:
            favourtieList.removeWhere((element) => element.id == recipe.id);
            favourtieList.add(recipe);
            // TODO: Handle this case.
            break;
          case DocumentChangeType.removed:
            favourtieList.removeWhere((element) => element.id == recipe.id);
            // TODO: Handle this case.
            break;
        }
      }
    });
  }
}
