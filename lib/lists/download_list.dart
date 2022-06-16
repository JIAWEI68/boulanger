import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class DownloadList with ChangeNotifier {
  List<Recipe> downloadList = [];
  List<Recipe> getDownloadList() {
    return downloadList;
  }

  void downloadItem(Recipe recipe) {}
}
