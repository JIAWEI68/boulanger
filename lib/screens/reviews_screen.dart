import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/screens/add_reviews_screen.dart';

import '../list_views/reviews_list_view.dart';
import '../lists/reviews_list.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllReviews reviewsList = Provider.of<AllReviews>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: reviewsList.getReviews().isNotEmpty
            ? const ReviewsListView()
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
