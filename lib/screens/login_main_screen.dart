import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/screens/download_screen.dart';
import 'package:recipes_app/screens/favourite_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';

import '../lists/download_list.dart';
import '../lists/reviews_list.dart';
import 'add_reviews_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllReviews>(
          create: (ctx) => AllReviews(),
        ),
        ChangeNotifierProvider<DownloadList>(
          create: (ctx) => DownloadList(),
        ),
        ChangeNotifierProvider<RecipeList>(create: (ctx) => RecipeList()),
        ChangeNotifierProvider<FavouriteList>(create: (ctx) => FavouriteList())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(254, 238, 210, 10),
          ),
          home: LoginMainScreen(),
          routes: {
            DownloadScreen.routeName: (_) {
              return DownloadScreen();
            },
            LikeScreen.routeName: (_) {
              return LikeScreen();
            },
            AddReviewsScreen.routeName: (_) {
              return AddReviewsScreen();
            }
          }),
    );
  }
}

class LoginMainScreen extends StatefulWidget {
  @override
  State<LoginMainScreen> createState() => _LoginMainScreenState();
}

class _LoginMainScreenState extends State<LoginMainScreen> {
  int selectedIndex = 1;
  final screens = [DownloadScreen(), HomeScreen(), LikeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
          title: const Text(
            'boulanger',
            style: TextStyle(color: Colors.blueGrey),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                setState(() {
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        ),
                        hintText: 'Search for a recipe'),
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                //Navigator.push(
                //context,
                //MaterialPageRoute(
                //builder: (context) => ()));
              },
            )
          ],
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: const Color.fromRGBO(254, 238, 210, 10)),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.download), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "")
              ],
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  //screens[selectedIndex];
                });
              },
            )));
  }
}