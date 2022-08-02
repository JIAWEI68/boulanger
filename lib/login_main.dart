import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/screens/download_screen.dart';
import 'package:recipes_app/screens/favourite_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';

import 'lists/download_list.dart';
import 'lists/reviews_list.dart';

void main() {
  //hide the bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(MyApp());
}

//everything here is similar to main.dart as it is to be the screen after users login
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllReviews>(
          create: (ctx) => AllReviews(),
        ),
        ChangeNotifierProvider<DownloadProvider>(
          create: (ctx) => DownloadProvider(),
        ),
        ChangeNotifierProvider<RecipeProvider>(
            create: (ctx) => RecipeProvider()),
        ChangeNotifierProvider<FavouriteProvider>(
            create: (ctx) => FavouriteProvider())
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
          }),
    );
  }
}

class LoginMainScreen extends StatefulWidget {
  static String routeName = "/loginMain";
  @override
  State<LoginMainScreen> createState() => _LoginMainScreenState();
}

class _LoginMainScreenState extends State<LoginMainScreen> {
  int selectedIndex = 1;
  //list of screens to show in the home screen as a widget
  final screens = [DownloadScreen(), const HomeScreen(), LikeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                Icons.person,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
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
