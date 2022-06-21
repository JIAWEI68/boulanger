import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/grid_views/download_grid_view.dart';
import 'package:recipes_app/lists/download_list.dart';

class DownloadScreen extends StatelessWidget {
  static String routeName = '/download';
  @override
  Widget build(BuildContext context) {
    DownloadList downloadedList = Provider.of<DownloadList>(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 606,
          child: const DownloadGridView(),
        ),
      ],
    ));
  }
}
