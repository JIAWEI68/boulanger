import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '''Most Asked Questions:''',
                style: TextStyle(fontSize: 50),
              ),
              //this is to make the text show the string exactly as how it shows
              Text(
                '''How do I Download Recipes?
Press the share button and there will be a pop up asking if you want to share or download from there you can download the recipe
Where can I find the recipes that I liked?
Press the heart button at the bottom of the screen in the home page and it will show you where your liked recipes are.
Where do I find my downloaded recipes?
In the home screen, there is a download icon, click that and it should show you the recipes you downloaded.''',
                style: TextStyle(fontFamily: "Rockwell", fontSize: 30),
              )
            ],
          ),
        ));
  }
}
