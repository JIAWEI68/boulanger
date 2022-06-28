import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/recipe_list.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/screens/add_recipe_screen.dart';
import 'package:recipes_app/screens/faq_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    RecipeList recipeList = Provider.of<RecipeList>(context);
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
              child: Image.asset("images/profile_icon.png")),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Username",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Vegetarian",
                  style: TextStyle(fontFamily: "Rockwell", fontSize: 20),
                ),
                Switch(
                  activeColor: Color.fromRGBO(251, 170, 28, 10),
                  inactiveThumbColor: Color.fromRGBO(251, 170, 28, 10),
                  value: recipeList.checkVegetarian,
                  onChanged: (value) {
                    setState(() {
                      recipeList.checkVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Directionality(
                //set so that the icon for the elevatedbutton.icon is set to the right
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(Icons.chevron_left,
                      color: Color.fromRGBO(251, 170, 28, 10)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(500, 70),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black)),
                      primary: Colors.white),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 0.2),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  onPressed: () {
                    //this makes it so that when the button is pressed it goes to the FAQScreen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FAQScreen()));
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
                            builder: (context) => AddRecipesScreen()));
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
                  side: BorderSide(color: Color.fromRGBO(251, 170, 28, 10)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
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
  }
}
