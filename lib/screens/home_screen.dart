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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
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
            Container(
              height: 537,
              child: RecipesGridView(),
            )
          ]),
    );
  }
}
