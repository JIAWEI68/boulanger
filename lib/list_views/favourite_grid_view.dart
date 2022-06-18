import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/screens/favourite_recipe_screen.dart';

class FavouriteGridView extends StatefulWidget {
  const FavouriteGridView({Key? key}) : super(key: key);

  @override
  State<FavouriteGridView> createState() => _FavouriteGridViewState();
}

class _FavouriteGridViewState extends State<FavouriteGridView> {
  @override
  Widget build(BuildContext context) {
    FavouriteList favouriteList = Provider.of<FavouriteList>(context);
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    FavouriteRecipeScreen.goToRecipeDetails(
                        context, favouriteList.getFavourtieList()[i]);
                  },
                  child: Image.network(
                    favouriteList.getFavourtieList()[i].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ));
        },
        itemCount: favouriteList.getFavourtieList().length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (133 / 123),
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 3.0));
  }
}
