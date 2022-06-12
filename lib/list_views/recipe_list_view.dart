import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

import '../screens/recipes_screens.dart';

class RecipesListView extends StatelessWidget {
  List<Recipe> recipesList;
  RecipesListView(this.recipesList);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) {
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              recipesList[i].imageUrl,
            ),
          ),
          title: Text(recipesList[i].recipeName),
          onTap: () {
            RecipesScreens.goToRecipeDetails(context, recipesList[i]);
          },
        );
      },
      separatorBuilder: (ctx, i) {
        return Divider(
          height: 5,
        );
      },
      itemCount: recipesList.length,
    );
  }
}
