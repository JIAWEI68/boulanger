import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/grid_views/favourite_grid_view.dart';
import 'package:recipes_app/lists/favourite_list.dart';

class LikeScreen extends StatefulWidget {
  static String routeName = 'like';

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

//similar to the home screen but instead with a change of variable names
class _LikeScreenState extends State<LikeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FavouriteProvider favouriteList = Provider.of<FavouriteProvider>(context);
    return Consumer(
      builder:
          (BuildContext context, FavouriteProvider provider, Widget? child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      favouriteList.searchString = value.toLowerCase();
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "Search", suffixIcon: Icon(Icons.search)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 537.0009,
                  width: 350,
                  child: FavouriteGridView(
                    controller: searchController,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
