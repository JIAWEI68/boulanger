import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/list_views/reviews_list_view.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/add_reviews_screen.dart';

import '../lists/reviews_list.dart';

class ReviewsScreen extends StatelessWidget {
  final Recipe recipeName;
  const ReviewsScreen({Key? key, required this.recipeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllReviews reviewsList = Provider.of<AllReviews>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
        title: const Text(
          "Reviews",
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        //to set that when the reviews list is empty, itll show an image
        //when there is something in the list, itll show the items in the list
        child: reviewsList.getReviews().isNotEmpty
            ? ReviewsListView(
                recipeName: recipeName,
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsefcieauByyyjcSm05s31ZbdNzSFTLnREQQ&usqp=CAU"),
                  const Text("No reviews yet, add one today!")
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToAddReviews(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void goToAddReviews(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddReviewsScreen()));
  }
}
