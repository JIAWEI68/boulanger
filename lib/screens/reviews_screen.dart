import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/screens/add_reviews_screen.dart';
import 'package:recipes_app/screens/edit_reviews_screen.dart';

import '../lists/reviews_list.dart';

class ReviewsScreen extends StatelessWidget {
  final String recipeName;
  const ReviewsScreen({Key? key, required this.recipeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllReviews reviewsListProvider = Provider.of<AllReviews>(context);
    var reviewsList = reviewsListProvider
        .getReviews()
        .where((element) => element.recipeName == recipeName)
        .toList();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
        title: Text(
          "Reviews" "(" + recipeName + ")",
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        //to set that when the reviews list is empty, itll show an image
        //when there is something in the list, itll show the items in the list
        child: reviewsList.isNotEmpty
            ? ListView.separated(
                itemBuilder: (ctx, i) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      reviewsListProvider.removeReviews(i);
                    },
                    child: ListTile(
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
                      onTap: () {
                        EditReviewsScreen.goToEditScreen(
                            context, reviewsList[i], recipeName);
                      },
                      title: Text(reviewsList[i].username),
                      subtitle: Text(reviewsList[i].description),
                    ),
                  );
                },
                itemCount: reviewsList.length,
                separatorBuilder: (ctx, i) {
                  return const Divider(height: 3, color: Colors.blueGrey);
                },
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
        context,
        MaterialPageRoute(
            builder: (context) => AddReviewsScreen(
                  recipeName: recipeName,
                )));
  }
}
