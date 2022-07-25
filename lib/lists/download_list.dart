import 'package:flutter/material.dart';

import '../models/recipe.dart';

class DownloadList with ChangeNotifier {
  List<Recipe> downloadList = [];

  List<Recipe> getDownloadList() {
    return downloadList;
  }
  //
  // void downloadItem(imageUrl, recipeName, description, vegetarian, difficulty,
  //     madeBy, category, steps, ingredients, calories) {
  //   downloadList.insert(
  //       0,
  //       Recipe(
  //         imageUrl: imageUrl,
  //         recipeName: recipeName,
  //         description: description,
  //         vegetarian: vegetarian,
  //         difficulty: difficulty,
  //         madeBy: madeBy,
  //         category: category,
  //         steps: steps,
  //         ingredients: ingredients,
  //         calories: calories,
  //       ));
  //   notifyListeners();
  // }

  //remove the downloaded item based on the item and not based on the index
  void deleteDownloadedItem(Recipe recipe) {
    downloadList.remove(recipe);
    notifyListeners();
  }

  //set the search string to allow the list to be filtered
  String searchString = "";
}
