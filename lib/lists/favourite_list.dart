import 'package:flutter/cupertino.dart';
import 'package:recipes_app/models/recipe.dart';

class FavouriteList with ChangeNotifier {
  List<Recipe> favourtieList = [];
  List<Recipe> getFavourtieList() {
    return favourtieList;
  }

  void addToFavourite(Recipe recipe) {
    favourtieList.insert(0, recipe);
    notifyListeners();
  }

  void removeFavourite(Recipe recipe) {
    favourtieList.remove(recipe);
    notifyListeners();
  }

//allow the favourite list to be filtered based on this string when the value is changed
  String searchString = "";
}
