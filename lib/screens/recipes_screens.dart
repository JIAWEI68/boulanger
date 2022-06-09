import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class RecipesScreens extends StatelessWidget {
  final Recipe recipe;
  const RecipesScreens(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: Image.network(recipe.imageUrl),
      ),
    );
  }
}


