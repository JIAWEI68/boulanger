import 'package:flutter/material.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/screens/add_recipe_screen.dart';
import 'package:recipes_app/screens/faq_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Icon(
              Icons.account_circle,
              size: 125,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Username",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Directionality(
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
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              child: Text(
                "Log Out",
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: "Segoe"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
