import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeList with ChangeNotifier {
  List<Recipe> myRecipes = [
    Recipe(
        "https://www.recipetineats.com/wp-content/uploads/2019/12/Christmas-Cake-decorated-with-fondant-marzipan-and-cherries.jpg",
        "Christmas Cake",
        "0"),
    Recipe(
        "https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/16714-birthday-cake-600x600.jpg?ext=.jpg",
        "Birthday Cake",
        "1")
  ];
}
