import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/screens/download_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/like_screen.dart';

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
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainScreen(),
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
  int selectedIndex = 0;
  final screens = [const HomeScreen(), DownloadScreen(), LikeScreen()];
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
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            )
          ],
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            const BottomNavigationBarItem(
                icon: Icon(Icons.download), label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "")
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
