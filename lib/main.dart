import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/screens/download_screen.dart';
import 'package:recipes_app/screens/favourite_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/login_sign_up_screen.dart';
import 'package:recipes_app/screens/splash_screen.dart';

import 'lists/download_list.dart';
import 'lists/reviews_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //the providers of the list
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
          //remove the debug banner at the top right of the screen
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(254, 238, 210, 10),
          ),
          //set it so that when the app first launches it shows the splash screen first
          home: const SplashScreen(),
          //the routes of the screens
          routes: {
            DownloadScreen.routeName: (_) {
              return DownloadScreen();
            },
            LikeScreen.routeName: (_) {
              return LikeScreen();
            },
            MainScreen.routeName: (_) {
              return MainScreen();
            }
          }),
    );
  }
}

class MainScreen extends StatefulWidget {
  static String routeName = "/main";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //set the index of the bottom nav, this is the index of the list screens
  //when the app is launched, the app will show home screen first
  //to set the index of the list when the icon in the bottom nav is pressed
  int selectedIndex = 1;
  //the list of the screens to be set into the body of the main screen
  final screens = [DownloadScreen(), HomeScreen(), LikeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //ensure that when the keyboard is pressed, there will be no bottom overflow error
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          //this is to remove the back arrow when the screen is pushed onto
          automaticallyImplyLeading: false,
          //change the color of the app bar to a custom color
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
                        builder: (context) => LoginAndSignUpScreen()));
              },
            )
          ],
        ),
        //set the body the with the screens as widgets
        body: screens[selectedIndex],
        bottomNavigationBar:
            //set the nav bar theme based on the theme of the app
            Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: const Color.fromRGBO(254, 238, 210, 10)),
                child: BottomNavigationBar(
                  //remove all the labels and ensure that the icons are in the center of the bottom nav
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.download), label: ""),
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: "")
                  ],
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    //set the index based on the icon that is pressed
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                )));
  }
}
