import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

import '../screens/recipes_screens.dart';

class RecipesListView extends StatelessWidget {
  List<Recipe> recipesList;
  RecipesListView(this.recipesList);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (ctx, i) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              RecipesScreens.goToRecipeDetails(context, recipesList[i]);
            },
            child: Image.network(
              recipesList[i].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: recipesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
    );
  }
}
