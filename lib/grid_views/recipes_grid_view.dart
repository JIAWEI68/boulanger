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
    //call the list based on the search string
    List<Recipe> recipeList = Provider.of<RecipeList>(context)
        .getAllRecipe()
        .where((element) =>
            element.recipeName.toLowerCase().contains(searchString))
        .toList();

    return GridView.builder(
      itemBuilder: (BuildContext context, int index) {
        //give the grid tile a border
        return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  //pass the data of the recipe list into the screen
                  RecipesScreens.goToRecipeDetails(context, recipeList[index]);
                },
                child: Image.network(
                  recipeList[index].imageUrl,
                  //check whether the link of the image is valid
                  //if not valid it shows a blue card inside the grid tile instead
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return ClipRRect(
                      child: Card(
                        color: Colors.blue,
                      ),
                    );
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
