import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';

class DownloadProvider with ChangeNotifier {
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
  DownloadProvider() {
    FirebaseFirestore.instance
        .collection("downloads")
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        Recipe recipe = Recipe.fromMap(change.doc.data()!, change.doc.id);
        switch (change.type) {
          case DocumentChangeType.added:
            downloadList.add(recipe);
            break;
          case DocumentChangeType.modified:
            downloadList.removeWhere((element) => element.id == recipe.id);
            downloadList.add(recipe);
            // TODO: Handle this case.
            break;
          case DocumentChangeType.removed:
            downloadList.removeWhere((element) => element.id == recipe.id);
            // TODO: Handle this case.
            break;
        }
      }
    });
  }
}
