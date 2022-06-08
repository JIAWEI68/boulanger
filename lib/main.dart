import 'package:flutter/material.dart';
import 'package:recipes_app/screens/download_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/like_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          }
        });
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final screens = [HomeScreen(), DownloadScreen(), LikeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('boulanger'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            )
          ],
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.download), label: ""),
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
