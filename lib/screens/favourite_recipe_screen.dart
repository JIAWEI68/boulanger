import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/reviews_screen.dart';

class FavouriteRecipeScreen extends StatelessWidget {
  final Recipe favouritedRecipe;
  const FavouriteRecipeScreen({Key? key, required this.favouritedRecipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteList favouriteList = Provider.of<FavouriteList>(context);
    var calories = favouritedRecipe.calories.toString();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.share,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    actions: <CupertinoActionSheetAction>[
                      CupertinoActionSheetAction(
                        /// This parameter indicates the action would be a default
                        /// default behavior, turns the action's text to bold text.
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Share'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {},
                        child: const Text('Download'),
                      ),
                      CupertinoActionSheetAction(
                        /// This parameter indicates the action would perform
                        /// a destructive action such as delete or exit and turns
                        /// the action's text color to red.
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
                child: GFAvatar(
              backgroundImage: NetworkImage(
                favouritedRecipe.imageUrl,
              ),
              shape: GFAvatarShape.square,
              radius: 200,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(favouritedRecipe.recipeName,
                    style: const TextStyle(
                        fontSize: 35,
                        fontFamily: "Adobe Devanagari",
                        color: Color.fromRGBO(114, 92, 92, 10))),
                IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    favouriteList.removeFavourite(favouritedRecipe);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text(
                    "Reviews",
                    style: TextStyle(
                        color: Colors.black, fontFamily: "Segoe", fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(190, 42),
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {
                    showReviews(BuildContext, context);
                  },
                ),
                ElevatedButton(
                  child: const Text(
                    "Calories",
                    style: TextStyle(
                        color: Colors.black, fontFamily: "Segoe", fontSize: 20),
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
                        title: const Text("Calories"),
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
                      "Difficulty: " + favouritedRecipe.difficulty,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      "Made By: " + favouritedRecipe.madeBy,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ));
  }

  static void goToRecipeDetails(BuildContext context, Recipe favouritedRecipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FavouriteRecipeScreen(favouritedRecipe: favouritedRecipe)),
    );
  }

  void showReviews(BuildContext, context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReviewsScreen()));
  }
}
