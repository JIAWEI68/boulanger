import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/reviews_screen.dart';

class FavouriteRecipeScreen extends StatefulWidget {
  final Recipe favouritedRecipe;
  const FavouriteRecipeScreen({Key? key, required this.favouritedRecipe})
      : super(key: key);

  @override
  State<FavouriteRecipeScreen> createState() => _FavouriteRecipeScreenState();

  static void goToRecipeDetails(BuildContext context, Recipe favouritedRecipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FavouriteRecipeScreen(favouritedRecipe: favouritedRecipe)),
    );
  }
}

class _FavouriteRecipeScreenState extends State<FavouriteRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    FavouriteList favouriteList = Provider.of<FavouriteList>(context);
    var calories = widget.favouritedRecipe.calories.toString();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: GFAvatar(
                backgroundImage: NetworkImage(
                  widget.favouritedRecipe.imageUrl,
                ),
                shape: GFAvatarShape.square,
                radius: 200,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.favouritedRecipe.recipeName,
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
                      favouriteList.removeFavourite(widget.favouritedRecipe);
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
                                  widget.favouritedRecipe.difficulty,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: "Segoe"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Made By: " + widget.favouritedRecipe.madeBy,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: "Segoe"),
                            ),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        widget.favouritedRecipe.description,
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
                                      widget.favouritedRecipe.steps,
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
                                    child: Text(
                                        widget.favouritedRecipe.ingredients),
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
