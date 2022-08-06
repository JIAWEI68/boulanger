import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/favourite_list.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/providers/users_providers.dart';
import 'package:recipes_app/screens/download_screen.dart';
import 'package:recipes_app/screens/favourite_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';
import 'package:recipes_app/screens/splash_screen.dart';
import 'package:recipes_app/services/firestore_services.dart';

import 'lists/download_list.dart';
import 'lists/reviews_list.dart';
import 'models/users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //hide the bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //the lists of the list
      providers: [
        ChangeNotifierProvider.value(value: ReviewsProvider()),
        ChangeNotifierProvider.value(value: DownloadProvider()),
        ChangeNotifierProvider.value(value: RecipeProvider()),
        ChangeNotifierProvider.value(value: FavouriteProvider()),
        ChangeNotifierProvider.value(value: UserProvider())
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
  String imageLink =
      "https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-person-user-19.png";
  final user = FirebaseAuth.instance.currentUser!;
  //set the index of the bottom nav, this is the index of the list screens
  //when the app is launched, the app will show home screen first
  //to set the index of the list when the icon in the bottom nav is pressed
  int selectedIndex = 1;
  //the list of the screens to be set into the body of the main screen
  final screens = [DownloadScreen(), HomeScreen(), LikeScreen()];
  List<Users> users = [];
  FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    print(user.email!);
    return StreamBuilder<Object>(
        stream: firestoreService.getUsers(),
        builder: (context, snapshot) {
          return Consumer(
            builder:
                (BuildContext context, UserProvider provider, Widget? child) {
              users = provider.userList
                  .where((element) => element.email == user.email)
                  .toList();
              if (users[0].imageUrl == "") {
                imageLink =
                    "https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-person-user-19.png";
              } else {
                imageLink = users[0].imageUrl;
              }
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
                      GestureDetector(
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            backgroundImage:
                                NetworkImage(imageLink, scale: 0.5)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsScreen()));
                        },
                      ),
                    ],
                  ),
                  //set the body the with the screens as widgets
                  body: screens[selectedIndex],
                  bottomNavigationBar:
                      //set the nav bar theme based on the theme of the app
                      Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor:
                                  const Color.fromRGBO(254, 238, 210, 10)),
                          child: BottomNavigationBar(
                            //remove all the labels and ensure that the icons are in the center of the bottom nav
                            showSelectedLabels: false,
                            showUnselectedLabels: false,
                            items: const [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.download), label: ""),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home), label: ""),
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
            },
          );
        });
  }
}
