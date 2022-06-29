import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/models/recipe.dart';

import '../screens/recipes_screens.dart';

class RecipesGridView extends StatefulWidget {
  const RecipesGridView({Key? key}) : super(key: key);

  @override
  State<RecipesGridView> createState() => _RecipesGridViewState();
}

class _RecipesGridViewState extends State<RecipesGridView> {
  @override
  Widget build(BuildContext context) {
    //call the search string inside the recipe list class to allow search
    String searchString = Provider.of<RecipeList>(context).searchString;
    bool checkVegetarian = Provider.of<RecipeList>(context).checkVegetarian;
    //call the list based on the search string
    List<Recipe> recipeList = Provider.of<RecipeList>(context)
        .getAllRecipe()
        .where((element) =>
            element.recipeName.toLowerCase().contains(searchString))
        .toList();
    RecipeList removeRecipe = Provider.of<RecipeList>(context);
    print(checkVegetarian);

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
                  recipeList[index].imageUrl, errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                    return Text("Invalid Image");
                },
                  fit: BoxFit.cover,
                ),
              ),
            ));
      },
      shrinkWrap: false,
      addAutomaticKeepAlives: true,
      itemCount: recipeList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //set the size of the grid tile
          childAspectRatio: (123 / 113),
          //set the amount of grid tile in a row
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 10.0),
    );
  }
}
