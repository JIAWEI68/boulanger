import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/recipe_list.dart';

import '../screens/recipes_screens.dart';

class RecipesGridView extends StatelessWidget {
  const RecipesGridView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RecipeList recipeList = Provider.of<RecipeList>(context);
    return GridView.builder(
      itemBuilder: (ctx, i) {
        return recipeList
                .getAllRecipe()[i]
                .recipeName
                .toLowerCase()
                .contains(recipeList.searchString)
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: GridTile(
                  child: GestureDetector(
                    onTap: () {
                      RecipesScreens.goToRecipeDetails(
                          context, recipeList.getAllRecipe()[i]);
                    },
                    child: Image.network(
                      recipeList.getAllRecipe()[i].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            : Container();
      },
      itemCount: recipeList.getAllRecipe().length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (133 / 123),
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 3.0),
    );
  }
}
