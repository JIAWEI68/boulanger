import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/recipes_screens.dart';

class RecipesListView extends StatelessWidget {
  final List<Recipe> recipesList;
  RecipesListView(this.recipesList);
  int selectedIndex = 0;
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
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipesScreens(recipe: recipesList[i]),
              )

            )
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
