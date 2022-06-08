import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class RecipesListView extends StatelessWidget {
  List<Recipe> recipesList;
  RecipesListView(this.recipesList);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) {
        return ListTile(
          leading: Image.network(
            recipesList[i].imageUrl,
          ),
          title: Text(recipesList[i].name),
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
