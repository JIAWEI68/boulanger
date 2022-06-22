import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/grid_views/recipes_grid_view.dart';
import 'package:recipes_app/lists/recipe_list.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    RecipeList recipeList = Provider.of<RecipeList>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    recipeList.searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                    labelText: "Search", suffixIcon: Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.only(),
                height: 537.0009,
                width: 350,
                child: RecipesGridView(),
              ),
            )
          ]),
    );
  }
}
