import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/recipes_screens.dart';
import 'package:recipes_app/services/firestore_services.dart';

class FavouriteGridView extends StatefulWidget {
  const FavouriteGridView({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  State<FavouriteGridView> createState() => _FavouriteGridViewState();
}

class _FavouriteGridViewState extends State<FavouriteGridView> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController searchController = widget.controller;
    String searchString = Provider.of<FavouriteProvider>(context).searchString;
    // List<Recipe> favouriteList = Provider.of<FavouriteProvider>(context)
    //     .getFavourtieList();
    List<Recipe> favouriteList = [];
    FirestoreService firestoreService = FirestoreService();
    return StreamBuilder<List<Recipe>>(
      stream: firestoreService.getFavourites(),
      builder: (BuildContext context, snapshot) {  return Consumer<FavouriteProvider>(
        builder:
            (BuildContext context, FavouriteProvider provider, Widget? child) {
          print(favouriteList);
          print(searchController.text);
          if (searchController.text.isEmpty) {
            favouriteList = provider.favourtieList;
          } else {
            favouriteList = provider.favourtieList
                .where((element) => element.recipeName
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
                .toList();
          }
          print(searchController.text.toLowerCase());
          return GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: GridTile(
                      child: GestureDetector(
                        onTap: () {
                          RecipesScreens.goToRecipeDetails(
                              context, favouriteList[i]);
                        },
                        child: Image.network(
                          favouriteList[i].imageUrl,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return ClipRRect(
                              child: Card(
                                color: Colors.blue,
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ));
              },
              itemCount: favouriteList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (123 / 113),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 10.0));
        },
      ); },

    );
  }
}
