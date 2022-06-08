import 'package:flutter/material.dart';
import 'package:recipes_app/list_views/recipe_list_view.dart';
import 'package:recipes_app/models/recipe.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Recipe> myRecipes = [
      Recipe(
          "https://www.recipetineats.com/wp-content/uploads/2019/12/Christmas-Cake-decorated-with-fondant-marzipan-and-cherries.jpg",
          "Christmas Cake"),
      Recipe(
          "https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/16714-birthday-cake-600x600.jpg?ext=.jpg",
          "Birthday Cake")
    ];
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(),
        Container(
          height: 606,
          child: RecipesListView(myRecipes),
        )
      ]),
    );
  }
}
