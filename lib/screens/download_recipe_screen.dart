import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/screens/reviews_screen.dart';

import '../lists/download_list.dart';
import '../models/recipe.dart';

class DownloadedRecipeScreens extends StatefulWidget {
  const DownloadedRecipeScreens(
      {Key? key, required this.downloadedRecipesDisplay});
  final Recipe downloadedRecipesDisplay;

  @override
  State<DownloadedRecipeScreens> createState() =>
      _DownloadedRecipeScreensState();

  static void goToRecipeDetails(
      BuildContext context, Recipe downloadedRecipeDisplay) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DownloadedRecipeScreens(
              downloadedRecipesDisplay: downloadedRecipeDisplay)),
    );
  }
}

class _DownloadedRecipeScreensState extends State<DownloadedRecipeScreens> {
  final String routeName = '/downloadRecipes';

  @override
  Widget build(BuildContext context) {
    DownloadList downloadedList = Provider.of<DownloadList>(context);
    var calories = widget.downloadedRecipesDisplay.calories.toString();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
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
                          downloadedList.deleteDownloadedItem(
                              widget.downloadedRecipesDisplay);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()));
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: GFAvatar(
                backgroundImage: NetworkImage(
                  widget.downloadedRecipesDisplay.imageUrl,
                ),
                shape: GFAvatarShape.square,
                radius: 200,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.downloadedRecipesDisplay.recipeName,
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
                          Container(
                            child: Text(
                                "Difficulty: " +
                                    widget.downloadedRecipesDisplay.difficulty,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: "Segoe")),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Made By: " +
                                  widget.downloadedRecipesDisplay.madeBy,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: "Segoe"),
                            ),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        widget.downloadedRecipesDisplay.description,
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        maxLines: 8,
                      ),
                    ],
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(120, 32),
                          shape: StadiumBorder(),
                          primary: Colors.white,
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text("Steps"),
                                  content: SingleChildScrollView(
                                    child: Text(
                                      widget.downloadedRecipesDisplay.steps,
                                    ),
                                  ),
                                ));
                      },
                      child: const Text(
                        "Steps",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Maiandra",
                            fontSize: 20),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(120, 32),
                          primary: Colors.white,
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Colors.black)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    "Ingredients",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  content: SingleChildScrollView(
                                    child: Text(widget
                                        .downloadedRecipesDisplay.ingredients),
                                  ),
                                ));
                      },
                      child: const Text(
                        "Ingredients",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Maiandra",
                        ),
                      ))
                ],
              ),
            ],
          ),
        ));
  }

  void showReviews(BuildContext, context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReviewsScreen()));
  }
}
