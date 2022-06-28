import 'package:flutter/material.dart';

import '../models/recipe.dart';

extension DuplicateRemoval<T> on List<T> {
  List<T> get removeAllDuplicates => [
        ...{...this}
      ];
}

class DownloadList with ChangeNotifier {
  List<Recipe> downloadList = [];

  List<Recipe> getDownloadList() {
    return downloadList;
  }

  void downloadItem(imageUrl, recipeName, description, vegetarian, difficulty,
      madeBy, steps, ingredients, calories) {
    downloadList.insert(
        0,
        Recipe(
          imageUrl: imageUrl,
          recipeName: recipeName,
          description: description,
          vegetarian: vegetarian,
          difficulty: difficulty,
          madeBy: madeBy,
          steps: steps,
          ingredients: ingredients,
          calories: calories,
        ));
    notifyListeners();
  }

  //remove the downloaded item based on the item and not based on the index
  void deleteDownloadedItem(Recipe recipe) {
    downloadList.remove(recipe);
    notifyListeners();
  }

  //set the search string to allow the list to be filtered
  String searchString = "";
}
