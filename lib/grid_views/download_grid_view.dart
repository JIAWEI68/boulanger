import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/download_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/providers/users_providers.dart';
import 'package:recipes_app/screens/recipes_screens.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../models/users.dart';

class DownloadGridView extends StatefulWidget {
  const DownloadGridView({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  State<DownloadGridView> createState() => _DownloadGridViewState();
}

class _DownloadGridViewState extends State<DownloadGridView> {
  final user = FirebaseAuth.instance.currentUser!;
  late TextEditingController downloadSearchController = widget.controller;
  //similar to the recipe grid view

  @override
  Widget build(BuildContext context) {
    List<Recipe> downloadList = [];
    List<Users> userList = [];
    // String searchString = Provider.of<DownloadList>(context).searchString;
    FirestoreService firestoreService = FirestoreService();
    String searchString = Provider.of<DownloadProvider>(context).searchString;
    return StreamBuilder<List<Recipe>>(
        stream: firestoreService.getDownloaded(),
        builder: (context, snapshot) {
          return Consumer2<DownloadProvider, UserProvider>(
            builder: (BuildContext context, DownloadProvider provider,
                UserProvider userProvider, Widget? child) {
              userList = userProvider.userList
                  .where((element) => element.email == user.email)
                  .toList();
              downloadList = provider.downloadList
                  .where((element) => element.userId == userList[0].id)
                  .toList();
              print(downloadSearchController.text);
              if (downloadSearchController.text.isEmpty) {
                downloadList = provider.downloadList
                    .where((element) => element.userId == userList[0].id)
                    .toList();
              } else {
                downloadList = provider.downloadList
                    .where((element) =>
                        element.recipeName
                            .toLowerCase()
                            .contains(downloadSearchController.text) &&
                        element.userId == userList[0].id)
                    .toList();
              }
              print(searchString.toLowerCase());
              print(downloadList.contains(searchString));
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
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
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
        });
  }
}
