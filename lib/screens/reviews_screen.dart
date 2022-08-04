import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/reviews.dart';
import 'package:recipes_app/models/users.dart';
import 'package:recipes_app/screens/add_reviews_screen.dart';
import 'package:recipes_app/screens/edit_reviews_screen.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../lists/reviews_list.dart';
import '../providers/users_providers.dart';

class ReviewsScreen extends StatelessWidget {
  final String recipeName;
  const ReviewsScreen({Key? key, required this.recipeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    List<Users> userList = [];
    ReviewsProvider reviewsListProvider = Provider.of<ReviewsProvider>(context);
    var reviewsList = reviewsListProvider
        .getReviews()
        .where((element) => element.recipeName == recipeName)
        .toList();
    List<Reviews> reviewList = [];
    FirestoreService firestoreService = FirestoreService();
    return StreamBuilder<List<Reviews>>(
        stream: firestoreService.getReviews(),
        builder: (context, snapshot) {
          reviewList = snapshot.data!
              .where((element) => element.recipeName == recipeName)
              .toList();
          return Consumer2(
            builder: (BuildContext context, ReviewsProvider provider,
                UserProvider userProvider, Widget? child) {
              userList = userProvider.userList
                  .where((element) => element.email == user.email)
                  .toList();
              reviewList = provider.reviewsList
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
                  child: snapshot.data!.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (ctx, i) {
                            return ClipRect(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: Colors.black38),
                                ),
                                child: ListTile(
                                  trailing: IconButton(
                                    icon:
                                        Icon(Icons.delete, color: Colors.black),
                                    onPressed: () {
                                      if (userList[0].username ==
                                          reviewList[i].username) {
                                        firestoreService
                                            .deleteReviews(reviewList[i].id);
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const AlertDialog(
                                            title: Text("Not your review!!!"),
                                          ),
                                        );
                                      }
                                    },
                                  ),
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
                                    if (userList[0].username ==
                                        reviewList[i].username) {
                                      EditReviewsScreen.goToEditScreen(
                                          context, reviewList[i], recipeName);
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => const AlertDialog(
                                          title: Text("Not your review!!!"),
                                        ),
                                      );
                                    }
                                  },
                                  title: Text(reviewList[i].username),
                                  subtitle: Text(reviewList[i].description),
                                ),
                              ),
                            );
                          },
                          itemCount: reviewList.length,
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
            },
          );
        });
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
