import 'package:flutter/material.dart';

import '../models/download.dart';

class DownloadList with ChangeNotifier {
  List<Download> downloadList = [];
  List<Download> getDownloadList() {
    return downloadList;
  }

  void downloadItem(imageUrl, recipeName, description, vegetarian, difficulty,
      madeBy, steps, ingredients, calories) {
    downloadList.insert(
        0,
        Download(
            imageUrl: imageUrl,
            recipeName: recipeName,
            description: description,
            vegetarian: vegetarian,
            difficulty: difficulty,
            madeBy: madeBy,
            steps: steps,
            ingredients: ingredients,
            calories: calories));
    notifyListeners();
  }
}
