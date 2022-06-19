import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/screens/reviews_screen.dart';

import '../lists/download_list.dart';
import '../models/recipe.dart';

class DownloadedRecipeScreens extends StatelessWidget {
  final String routeName = '/downloadRecipes';
  const DownloadedRecipeScreens(
      {Key? key, required this.downloadedRecipesDisplay});
  final Recipe downloadedRecipesDisplay;

  @override
  Widget build(BuildContext context) {
    DownloadList downloadedList = Provider.of<DownloadList>(context);
    var calories = downloadedRecipesDisplay.calories.toString();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
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
                        onPressed: () {
                          downloadedList
                              .deleteDownloadedItem(downloadedRecipesDisplay);
                        },
                        child: const Text(' Delete Download'),
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
                downloadedRecipesDisplay.imageUrl,
              ),
              shape: GFAvatarShape.square,
              radius: 200,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(downloadedRecipesDisplay.recipeName,
                    style: const TextStyle(
                        fontSize: 35,
                        fontFamily: "Adobe Devanagari",
                        color: Color.fromRGBO(114, 92, 92, 10))),
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
                      "Difficulty: " + downloadedRecipesDisplay.difficulty,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      "Made By: " + downloadedRecipesDisplay.madeBy,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ));
  }

  static void goToRecipeDetails(
      BuildContext context, Recipe downloadedRecipeDisplay) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DownloadedRecipeScreens(
              downloadedRecipesDisplay: downloadedRecipeDisplay)),
    );
  }

  void showReviews(BuildContext, context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReviewsScreen()));
  }
}
