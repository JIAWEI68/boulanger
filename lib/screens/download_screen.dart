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
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    downloadedList.searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                    labelText: "Search", suffixIcon: Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 537,
                width: 350,
                child: DownloadGridView(),
              ),
            ),
          ],
        ));
  }
}
