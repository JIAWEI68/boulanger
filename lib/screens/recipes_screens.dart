import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:recipes_app/models/recipe.dart';

class RecipesScreens extends StatelessWidget {
  final String routeName = '/recipes';
  const RecipesScreens({Key? key, required this.recipeToDisplay});
  final Recipe recipeToDisplay;

  @override
  Widget build(BuildContext context) {
    var calories = recipeToDisplay.calories.toString();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
                child: GFAvatar(
              backgroundImage: NetworkImage(
                recipeToDisplay.imageUrl,
              ),
              shape: GFAvatarShape.square,
              radius: 200,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(recipeToDisplay.recipeName),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text(
                    "Reviews",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(190, 42),
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text(
                    "Calories",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(190, 42),
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Calories"),
                        content: Text(calories + "KCAL"),
                      ),
                    );
                  },
                )
              ],
            ),
            Row(children: [
              Column(
                children: [
                  Container(
                    child: Text(
                      "Difficulty: " + recipeToDisplay.difficulty,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      "Made By: " + recipeToDisplay.madeBy,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ]),
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

  void showCalories(BuildContext context, Recipe recipeToDisplay) {}
}
