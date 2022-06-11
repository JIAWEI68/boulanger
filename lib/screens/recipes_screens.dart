import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class RecipesScreens extends StatelessWidget {
  final String routeName = '/recipes';
  const RecipesScreens({Key? key, required this.recipeToDisplay});
  final Recipe recipeToDisplay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipeToDisplay.name),
        ),
        body: Column(
          children: [
            Container(
              child: Image.network(
                recipeToDisplay.imageUrl,
              ),
            ),
            Row(
              children: [
                Text(recipeToDisplay.name),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ));
  }

  static void goToRecipeDetails(BuildContext context, Recipe recipeToDisplay) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RecipesScreens(recipeToDisplay: recipeToDisplay)),
    );
  }
}
