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

  void downloadItem(Recipe recipe) {
    downloadList.insert(
        0,
        Recipe(
            recipe.imageUrl,
            recipe.recipeName,
            recipe.description,
            recipe.vegetarian,
            recipe.difficulty,
            recipe.madeBy,
            recipe.steps,
            recipe.ingredients,
            recipe.calories));
    notifyListeners();
  }

  void deleteDownloadedItem(Recipe recipe) {
    downloadList.remove(recipe);
    notifyListeners();
  }
}
