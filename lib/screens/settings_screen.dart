import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/lists/reviews_list.dart';
import 'package:recipes_app/providers/users_providers.dart';
import 'package:recipes_app/screens/add_recipe_screen.dart';
import 'package:recipes_app/screens/edit_profile.dart';
import 'package:recipes_app/screens/faq_screen.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../models/reviews.dart';
import '../models/users.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  FirestoreService firestoreService = FirestoreService();
  List<Users> userList = [];
  List<Reviews> reviewsList = [];
  String imageLink =
      "https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-person-user-19.png";
  double height = 80;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeList = Provider.of<RecipeProvider>(context);
    return StreamBuilder(
        stream: firestoreService.getUsers(),
        builder: (context, snapshot) {
          return Consumer2<UserProvider, ReviewsProvider>(
            builder: (BuildContext context, UserProvider provider,
                ReviewsProvider reviewsProvider, Widget? child) {
              userList = provider.userList
                  .where((element) => element.email == user.email)
                  .toList();
              reviewsList = reviewsProvider.reviewsList;
              print(userList);
              if (userList[0].imageUrl == "") {
                imageLink =
                    "https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-person-user-19.png";
                height = 80;
              } else {
                imageLink = userList[0].imageUrl;
                height = 100;
              }
              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.blueGrey),
                  backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Color.fromRGBO(251, 170, 28, 10),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 65,
                            backgroundImage: NetworkImage(imageLink)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        userList[0].username,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //this makes it so that when the button is pressed it goes to the FAQScreen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfileScreen(
                                          users: userList[0])));
                            },
                            icon: Icon(Icons.chevron_left,
                                color: Color.fromRGBO(251, 170, 28, 10)),
                            label: Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(500, 70),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black))),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0.2),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //this makes it so that when the button is pressed it goes to the FAQScreen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FAQScreen()));
                            },
                            icon: Icon(Icons.chevron_left,
                                color: Color.fromRGBO(251, 170, 28, 10)),
                            label: Text(
                              "FAQ",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(500, 70),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black))),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0.2),
                        child: Directionality(
                          //this is universal for all the elevatedButton.icon for this screen
                          //this is to ensure that the icons are at the right side of the elevated button
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddRecipesScreen()));
                            },
                            icon: Icon(Icons.chevron_left,
                                color: Color.fromRGBO(251, 170, 28, 10)),
                            label: Text(
                              "Upload Recipe",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(500, 70),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black))),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            fixedSize: Size(153, 48),
                            side: BorderSide(
                                color: Color.fromRGBO(251, 170, 28, 10)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: Color.fromRGBO(251, 170, 28, 10),
                              fontSize: 18,
                              fontFamily: "Rockwell"),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
