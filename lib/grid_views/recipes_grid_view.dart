import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/models/recipe.dart';

import '../screens/recipes_screens.dart';

class RecipesGridView extends StatelessWidget {
  const RecipesGridView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String searchString = Provider.of<RecipeList>(context).searchString;
    List<Recipe> recipeList = Provider.of<RecipeList>(context)
        .getAllRecipe()
        .where((element) =>
            element.recipeName.toLowerCase().contains(searchString))
        .toList();
    return GridView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  RecipesScreens.goToRecipeDetails(context, recipeList[index]);
                },
                child: Image.network(
                  recipeList[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ));
      },
      shrinkWrap: false,
      addAutomaticKeepAlives: true,
      itemCount: recipeList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (123 / 113),
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 10.0),
    );
  }
}
