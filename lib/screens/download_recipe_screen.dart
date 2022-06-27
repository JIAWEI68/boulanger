// import 'dart:ui';
//
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:provider/provider.dart';
// import 'package:recipes_app/screens/reviews_screen.dart';
//
// import '../lists/download_list.dart';
// import '../models/recipe.dart';
//
// class DownloadedRecipeScreens extends StatefulWidget {
//   const DownloadedRecipeScreens(
//       {Key? key, required this.downloadedRecipesDisplay});
//   final Recipe downloadedRecipesDisplay;
//
//   @override
//   State<DownloadedRecipeScreens> createState() =>
//       _DownloadedRecipeScreensState();
//
//   static void goToRecipeDetails(
//       BuildContext context, Recipe downloadedRecipeDisplay) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => DownloadedRecipeScreens(
//               downloadedRecipesDisplay: downloadedRecipeDisplay)),
//     );
//   }
// }
//
// class _DownloadedRecipeScreensState extends State<DownloadedRecipeScreens> {
//   final String routeName = '/downloadRecipes';
//
//   @override
//   Widget build(BuildContext context) {
//     //call the downloaded list
//     DownloadList downloadedList = Provider.of<DownloadList>(context);
//     //change the value of the calories to string
//     var calories = widget.downloadedRecipesDisplay.calories.toString();
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.blueGrey),
//           backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.share),
//               onPressed: () {
//                 //show an action sheet like an iphone action shit
//                 showCupertinoModalPopup<void>(
//                   context: context,
//                   builder: (BuildContext context) => CupertinoActionSheet(
//                     actions: <CupertinoActionSheetAction>[
//                       CupertinoActionSheetAction(
//                         /// This parameter indicates the action would be a default
//                         /// default behavior, turns the action's text to bold text.
//                         isDefaultAction: true,
//                         onPressed: () {
//                           //go back to the previous screen
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Share'),
//                       ),
//                       CupertinoActionSheetAction(
//                         isDestructiveAction: true,
//                         onPressed: () {
//                           //delete the item in the download list based on the model
//                           downloadedList.deleteDownloadedItem(
//                               widget.downloadedRecipesDisplay);
//                           Navigator.pop(context);
//                         },
//                         child: const Text(' Delete Download'),
//                       ),
//                       CupertinoActionSheetAction(
//                         //this parameter indicates the action whether it is destructive for example close or delete.
//                         isDestructiveAction: true,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Close'),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                   child: GFAvatar(
//                 backgroundImage: NetworkImage(
//                   //ensure that the image of the recipes is universal and the same for every recipe
//                   widget.downloadedRecipesDisplay.imageUrl,
//                 ),
//                 shape: GFAvatarShape.square,
//                 radius: 200,
//               )),
//               Row(
//                 //this is to make it so that there is space between the items in the row
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(widget.downloadedRecipesDisplay.recipeName,
//                       style: const TextStyle(
//                           fontSize: 35,
//                           fontFamily: "Adobe Devanagari",
//                           color: Color.fromRGBO(114, 92, 92, 10))),
//                   IconButton(
//                     icon: const Icon(Icons.favorite),
//                     onPressed: () {},
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   //this button is to show the reviews
//                   ElevatedButton(
//                     child: const Text(
//                       "Reviews",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: "Segoe",
//                           fontSize: 20),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                         fixedSize: const Size(190, 42),
//                         primary: Colors.white,
//                         shape: const StadiumBorder(),
//                         side: const BorderSide(color: Colors.black)),
//                     onPressed: () {
//                       //this method is to go to the reviews screen when the button is pressed
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ReviewsScreen(
//                                     recipeName: widget.downloadedRecipesDisplay,
//                                   )));
//                     },
//                   ),
//                   ElevatedButton(
//                     child: const Text(
//                       "Calories",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: "Segoe",
//                           fontSize: 20),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                         fixedSize: const Size(190, 42),
//                         primary: Colors.white,
//                         shape: const StadiumBorder(),
//                         side: const BorderSide(color: Colors.black)),
//                     onPressed: () {
//                       //when the button is pressed it shows a dialog with the calories of the recipe
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text("Calories"),
//                           content: Text(calories + "KCAL"),
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               ),
//               Row(children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       //ensure that the difficulty is on the left side
//                       Row(
//                         children: [
//                           Container(
//                             child: Text(
//                                 "Difficulty: " +
//                                     widget.downloadedRecipesDisplay.difficulty,
//                                 textAlign: TextAlign.left,
//                                 style: const TextStyle(
//                                     fontSize: 20, fontFamily: "Segoe")),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           FittedBox(
//                             fit: BoxFit.cover,
//                             child: Text(
//                               "Made By: " +
//                                   widget.downloadedRecipesDisplay.madeBy,
//                               textAlign: TextAlign.left,
//                               style: const TextStyle(
//                                   fontSize: 20, fontFamily: "Segoe"),
//                             ),
//                           ),
//                         ],
//                       ),
//                       //ensure that the text do not cause a render flex error and the text fits the screen with the line break
//                       Card(
//                         child: AutoSizeText(
//                           widget.downloadedRecipesDisplay.description,
//                           style: const TextStyle(fontSize: 20),
//                           overflow: TextOverflow.fade,
//                           softWrap: true,
//                           maxLines: 8,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),
//               Row(
//                 //button when pressed to show the steps in an alert dialog
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           //change the shape of the elevated button and th color together with the border color
//                           fixedSize: Size(120, 32),
//                           shape: StadiumBorder(),
//                           primary: Colors.white,
//                           side: BorderSide(color: Colors.black)),
//                       onPressed: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                                   title: const Text("Steps"),
//                                   content: SingleChildScrollView(
//                                     //ensure that the text fits the alert dialog and is scrollable
//                                     child: Text(
//                                       widget.downloadedRecipesDisplay.steps,
//                                     ),
//                                   ),
//                                 ));
//                       },
//                       child: const Text(
//                         "Steps",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: "Maiandra",
//                             fontSize: 20),
//                       )),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           fixedSize: Size(120, 32),
//                           primary: Colors.white,
//                           shape: const StadiumBorder(),
//                           side: const BorderSide(color: Colors.black)),
//                       onPressed: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                                   title: const Text(
//                                     "Ingredients",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   //ensure that the text fits the dialog and is scrollable
//                                   content: SingleChildScrollView(
//                                     child: Text(widget
//                                         .downloadedRecipesDisplay.ingredients),
//                                   ),
//                                 ));
//                       },
//                       child: const Text(
//                         "Ingredients",
//                         style: TextStyle(
//                           //set a color and font type for the text
//                           color: Colors.black,
//                           fontFamily: "Maiandra",
//                         ),
//                       ))
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
