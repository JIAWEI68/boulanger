import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/screens/download_screen.dart';
import 'package:recipes_app/screens/favourite_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/splash_screen.dart';

import 'lists/download_list.dart';
import 'lists/reviews_list.dart';
import 'screens/add_reviews_screen.dart';

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
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
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

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;
  final screens = [DownloadScreen(), HomeScreen(), LikeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('boulanger'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for a recipe'),
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            )
          ],
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
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
        ));
  }
}
