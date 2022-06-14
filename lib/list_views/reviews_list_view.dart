import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../lists/reviews_list.dart';

class ReviewsListView extends StatefulWidget {
  const ReviewsListView({Key? key}) : super(key: key);

  @override
  State<ReviewsListView> createState() => _ReviewsListViewState();
}

class _ReviewsListViewState extends State<ReviewsListView> {
  @override
  Widget build(BuildContext context) {
    AllReviews reviewsList = Provider.of<AllReviews>(context);
    return ListView.separated(
      itemBuilder: (ctx, i) {
        return ListTile(
          leading: const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
          title: Text(reviewsList.getReviews()[i].username),
          subtitle: Text(reviewsList.getReviews()[i].description),
        );
      },
      itemCount: reviewsList.getReviews().length,
      separatorBuilder: (ctx, i) {
        return const Divider(height: 3, color: Colors.blueGrey);
      },
    );
  }
}
