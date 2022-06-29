import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/download_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/recipes_screens.dart';

class DownloadGridView extends StatefulWidget {
  const DownloadGridView({Key? key}) : super(key: key);

  @override
  State<DownloadGridView> createState() => _DownloadGridViewState();
}

class _DownloadGridViewState extends State<DownloadGridView> {
  //similar to the recipe grid view
  @override
  Widget build(BuildContext context) {
    String searchString = Provider.of<DownloadList>(context).searchString;
    List<Recipe> downloadedList = Provider.of<DownloadList>(context)
        .getDownloadList()
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
                  RecipesScreens.goToRecipeDetails(context, downloadedList[i]);
                },
                child: Image.network(
                  downloadedList[i].imageUrl,
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
      itemCount: downloadedList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (123 / 113),
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 3.0),
    );
  }
}
