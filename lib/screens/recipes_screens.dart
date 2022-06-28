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
  String downloadText = "Download";
  Color iconColor = Colors.black;
  final String routeName = '/recipes';
  bool chosen = false;
  @override
  Widget build(BuildContext context) {
    String card = widget.recipeToDisplay.steps;
    int selectedIndex = 0;
    final texts = [
      widget.recipeToDisplay.steps,
      widget.recipeToDisplay.ingredients
    ];
    FavouriteList favouriteList = Provider.of<FavouriteList>(context);
    DownloadList downloadedList = Provider.of<DownloadList>(context);
    if (favouriteList.getFavourtieList().every(
        (element) => element.recipeName != widget.recipeToDisplay.recipeName)) {
      iconColor = Colors.black;
    } else {
      iconColor = Colors.red;
    }
    if (downloadedList.getDownloadList().every(
        (element) => element.recipeName != widget.recipeToDisplay.recipeName)) {
      downloadText = "Download";
    } else {
      downloadText = "Delete Download";
    }
    if (chosen) card = widget.recipeToDisplay.ingredients;
    if (!chosen) card = widget.recipeToDisplay.steps;

    var calories = widget.recipeToDisplay.calories.toString();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blueGrey),
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
                        onPressed: () {
                          //checks if the download list has the same name inside the list
                          if (downloadedList.getDownloadList().every(
                              (element) =>
                                  element.recipeName !=
                                  widget.recipeToDisplay.recipeName)) {
                            //add the recipe into the list based on the items name, and the parameters
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Download successfully!'),
                              duration: Duration(milliseconds: 10),
                            ));
                            Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                              setState(() {
                                downloadedList
                                    .deleteDownloadedItem(widget.recipeToDisplay);
                              });
                            setState(() {
                              downloadText = "Delete Download";
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Item Successfully deleted'),
                              duration: Duration(milliseconds: 10),
                            ));
                          }
                        },
                        child: Text(downloadText),
                      ),
                      CupertinoActionSheetAction(
                        //this parameter indicates the action whether it is destructive for example close or delete.
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
              GFAvatar(
                backgroundImage: NetworkImage(
                  widget.recipeToDisplay.imageUrl,
                ),
                shape: GFAvatarShape.square,
                radius: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.recipeToDisplay.recipeName,
                      style: const TextStyle(
                          fontSize: 35,
                          fontFamily: "Adobe Devanagari",
                          color: Color.fromRGBO(114, 92, 92, 10))),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: iconColor,
                    ),
                    onPressed: () {
                      //check if there is duplicate item in the list
                      if (favouriteList.getFavourtieList().every((element) =>
                          element.recipeName !=
                          widget.recipeToDisplay.recipeName)) {
                        setState(() {
                          iconColor = Colors.red;
                        });
                        favouriteList.addToFavourite(widget.recipeToDisplay);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Added to favourites successfully!'),
                        ));
                      } else {
                        favouriteList.removeFavourite(widget.recipeToDisplay);
                        setState(() {
                          iconColor = Colors.black;
                        });
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewsScreen(
                                    recipeName:
                                        widget.recipeToDisplay.recipeName,
                                  )));
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
                            style: const TextStyle(
                                fontSize: 20, fontFamily: "Segoe"),
                          ),
                        ],
                      ),
                      //make it so the text is on the left side of the screen
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Made By: " + widget.recipeToDisplay.madeBy,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: "Segoe"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 140,
                        child: Card(
                          child: AutoSizeText(
                            widget.recipeToDisplay.description,
                            style: TextStyle(fontSize: 25),
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            maxLines: 8,
                          ),
                        ),
                      ),
                      Column(
                        children: [
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
                                    setState(() {
                                      chosen = false;
                                    });
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
                                      fixedSize: const Size(120, 32),
                                      primary: Colors.white,
                                      shape: const StadiumBorder(),
                                      side: const BorderSide(
                                          color: Colors.black)),
                                  onPressed: () {
                                    setState(() {
                                      chosen = true;
                                    });
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
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Text(card, style: TextStyle(fontSize: 20),),
                            ),
                          ),
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
}
