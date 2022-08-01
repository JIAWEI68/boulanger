import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/grid_views/download_grid_view.dart';
import 'package:recipes_app/lists/download_list.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/services/firestore_services.dart';

class DownloadScreen extends StatefulWidget {
  static String routeName = '/download';

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  TextEditingController downloadSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DownloadProvider downloadedList = Provider.of<DownloadProvider>(context);
    FirestoreService firestoreService = FirestoreService();
    return StreamBuilder<List<Recipe>>(
        stream: firestoreService.getDownloaded(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      //create a text field to allow search
                      child: TextField(
                        controller: downloadSearchController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                            labelText: "Search",
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        height: 537.0009,
                        width: 350,
                        child: DownloadGridView(
                          controller: downloadSearchController,
                        ),
                      ),
                    ),
                  ],
                ));
          }
        });
  }
}
