import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/grid_views/download_grid_view.dart';
import 'package:recipes_app/lists/download_list.dart';

class DownloadScreen extends StatefulWidget {
  static String routeName = '/download';

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    DownloadList downloadedList = Provider.of<DownloadList>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              //create a text field to allow search
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    //to set the search string in the download list to the value of the text field
                    //set a text field where it gets the value and sets it to searchString which is in downloadedList
                    downloadedList.searchString = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                    labelText: "Search", suffixIcon: Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 537.0009,
                width: 350,
                child: DownloadGridView(),
              ),
            ),
          ],
        ));
  }
}
