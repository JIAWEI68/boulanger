import 'package:flutter/material.dart';
import 'package:recipes_app/grid_views/favourite_grid_view.dart';

class LikeScreen extends StatelessWidget {
  static String routeName = 'like';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 606,
            child: FavouriteGridView(),
          )
        ],
      ),
    );
  }
}
