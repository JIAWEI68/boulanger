import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/models/users.dart';
import 'package:recipes_app/providers/users_providers.dart';
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
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    late TextEditingController searchController = widget.controller;
    String searchString = Provider.of<FavouriteProvider>(context).searchString;
    // List<Recipe> favouriteList = Provider.of<FavouriteProvider>(context)
    //     .getFavourtieList();
    List<Recipe> favouriteList = [];
    List<Users> userList = [];
    FirestoreService firestoreService = FirestoreService();
    return StreamBuilder<List<Recipe>>(
      stream: firestoreService.getFavourites(),
      builder: (BuildContext context, snapshot) {
        return Consumer2<FavouriteProvider, UserProvider>(
          builder: (BuildContext context, FavouriteProvider provider,
              UserProvider userProvider, Widget? child) {
            print(favouriteList);
            print(searchController.text);
            userList = userProvider.userList
                .where((element) => element.email == user.email)
                .toList();
            favouriteList = provider.favourtieList
                .where((element) => element.userId == userList[0].id)
                .toList();
            if (searchController.text.isEmpty) {
              favouriteList = provider.favourtieList
                  .where((element) => element.userId == userList[0].id)
                  .toList();
            } else {
              favouriteList = provider.favourtieList
                  .where((element) =>
                      element.recipeName
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase()) &&
                      element.userId == userList[0].id)
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
                itemCount: favouriteList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (123 / 113),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 10.0));
          },
        );
      },
    );
  }
}
