import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/recipes_screens.dart';

class FavouriteGridView extends StatefulWidget {
  const FavouriteGridView({Key? key}) : super(key: key);

  @override
  State<FavouriteGridView> createState() => _FavouriteGridViewState();
}

class _FavouriteGridViewState extends State<FavouriteGridView> {
  @override
  Widget build(BuildContext context) {
    String searchString = Provider.of<FavouriteList>(context).searchString;
    List<Recipe> favouriteList = Provider.of<FavouriteList>(context)
        .getFavourtieList()
        .where((element) =>
            element.recipeName.toLowerCase().contains(searchString))
        .toList();
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    RecipesScreens.goToRecipeDetails(context, favouriteList[i]);
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
  }
}
