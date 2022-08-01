import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/download_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/recipes_screens.dart';
import 'package:recipes_app/services/firestore_services.dart';

class DownloadGridView extends StatefulWidget {
  const DownloadGridView({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  State<DownloadGridView> createState() => _DownloadGridViewState();
}

class _DownloadGridViewState extends State<DownloadGridView> {
  late TextEditingController searchController = widget.controller;
  //similar to the recipe grid view
  @override
  Widget build(BuildContext context) {
    List<Recipe> downloadList = [];
    // String searchString = Provider.of<DownloadList>(context).searchString;
    FirestoreService firestoreService = FirestoreService();
    return Consumer<DownloadProvider>(
      builder:
          (BuildContext context, DownloadProvider provider, Widget? child) {
        if (searchController.text.isEmpty) {
          downloadList = provider.downloadList;
        } else {
          downloadList = provider.downloadList
              .where((element) => element.recipeName
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
              .toList();
          print(downloadList);
        }
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
                          context, downloadList[i]);
                    },
                    child: Image.network(
                      downloadList[i].imageUrl,
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
          itemCount: downloadList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (123 / 113),
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 3.0),
        );
      },
    );
  }
}
