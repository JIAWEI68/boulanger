import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

import '../screens/recipes_screens.dart';

class RecipesGridView extends StatelessWidget {
  List<Recipe> recipesList;
  RecipesGridView(this.recipesList, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (ctx, i) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  RecipesScreens.goToRecipeDetails(context, recipesList[i]);
                },
                child: Image.network(
                  recipesList[i].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ));
      },
      itemCount: recipesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (133 / 123),
          crossAxisCount: 3,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 3.0),
    );
  }
}
