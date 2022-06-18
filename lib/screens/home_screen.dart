import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/recipe_list.dart';

import '../list_views/recipes_grid_view.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipeList recipeList = Provider.of<RecipeList>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 606,
              child: RecipesGridView(),
            )
          ]),
    );
  }
}
