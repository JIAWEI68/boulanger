import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/reviews_screen.dart';

import '../lists/download_list.dart';

class RecipesScreens extends StatefulWidget {
  const RecipesScreens({Key? key, required this.recipeToDisplay})
      : super(key: key);
  final Recipe recipeToDisplay;

  @override
  State<RecipesScreens> createState() => _RecipesScreensState();

  static void goToRecipeDetails(BuildContext context, Recipe recipeToDisplay) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RecipesScreens(recipeToDisplay: recipeToDisplay)),
    );
  }
}

class _RecipesScreensState extends State<RecipesScreens> {
  final String routeName = '/recipes';

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final texts = [
      widget.recipeToDisplay.steps,
      widget.recipeToDisplay.ingredients
    ];
    FavouriteList favouriteList = Provider.of<FavouriteList>(context);
    DownloadList downloadedList = Provider.of<DownloadList>(context);
    var calories = widget.recipeToDisplay.calories.toString();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: Color.fromRGBO(254, 238, 210, 10),
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
                        onPressed: () {
                          if (downloadedList.getDownloadList().every(
                              (element) =>
                                  element.recipeName !=
                                  widget.recipeToDisplay.recipeName)) {
                            downloadedList.downloadItem(
                                widget.recipeToDisplay.imageUrl,
                                widget.recipeToDisplay.recipeName,
                                widget.recipeToDisplay.description,
                                widget.recipeToDisplay.vegetarian,
                                widget.recipeToDisplay.difficulty,
                                widget.recipeToDisplay.madeBy,
                                widget.recipeToDisplay.steps,
                                widget.recipeToDisplay.ingredients,
                                widget.recipeToDisplay.calories);
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                      content: Text(
                                          "Item is already downloaded. Please check your download page"),
                                    ));
                          }
                        },
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: GFAvatar(
                backgroundImage: NetworkImage(
                  widget.recipeToDisplay.imageUrl,
                ),
                shape: GFAvatarShape.square,
                radius: 200,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.recipeToDisplay.recipeName,
                      style: const TextStyle(
                          fontSize: 35,
                          fontFamily: "Adobe Devanagari",
                          color: Color.fromRGBO(114, 92, 92, 10))),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      if (favouriteList.getFavourtieList().every((element) =>
                          element.recipeName !=
                          widget.recipeToDisplay.recipeName)) {
                        favouriteList.addToFavourite(widget.recipeToDisplay);
                      }
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
                          color: Colors.black,
                          fontFamily: "Segoe",
                          fontSize: 20),
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
                          color: Colors.black,
                          fontFamily: "Segoe",
                          fontSize: 20),
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
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Difficulty: " + widget.recipeToDisplay.difficulty,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, fontFamily: "Segoe"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Made By: " + widget.recipeToDisplay.madeBy,
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 20, fontFamily: "Segoe"),
                            ),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        widget.recipeToDisplay.description,
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        maxLines: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Steps"),
                                          content: SingleChildScrollView(
                                            child: Text(
                                              widget.recipeToDisplay.steps,
                                            ),
                                          ),
                                        ));
                              },
                              child: Text("Steps")),
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Ingredients"),
                                          content: SingleChildScrollView(
                                            child: Text(widget
                                                .recipeToDisplay.ingredients),
                                          ),
                                        ));
                              },
                              child: Text("Ingredients"))
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ));
  }

  void showReviews(BuildContext, context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReviewsScreen()));
  }

  void onPressed(index) {
    int selectedIndex = index;
  }
}
