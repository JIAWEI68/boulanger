import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/recipes_screens.dart';
import 'package:recipes_app/services/firestore_services.dart';

class DownloadGridView extends StatefulWidget {
  const DownloadGridView({Key? key}) : super(key: key);

  @override
  State<DownloadGridView> createState() => _DownloadGridViewState();
}

class _DownloadGridViewState extends State<DownloadGridView> {
  //similar to the recipe grid view
  @override
  Widget build(BuildContext context) {
    // String searchString = Provider.of<DownloadList>(context).searchString;
    FirestoreService firestoreService = FirestoreService();
    return StreamBuilder<List<Recipe>>(
        stream: firestoreService.getDownloaded(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else {
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
                              context, snapshot.data![i]);
                        },
                        child: Image.network(
                          snapshot.data![i].imageUrl,
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
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (123 / 113),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 3.0),
            );
          }
        });
  }
}
