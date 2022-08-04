import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipes_app/models/users.dart';

class UserProvider with ChangeNotifier {
  List<Users> userList = [];
  UserProvider() {
    FirebaseFirestore.instance.collection("users").snapshots().listen((event) {
      for (var change in event.docChanges) {
        Users users = Users.fromMap(change.doc.data()!, change.doc.id);
        switch (change.type) {
          case DocumentChangeType.added:
            userList.add(users);
            break;
          case DocumentChangeType.modified:
            userList.removeWhere((element) => element.id == users.id);
            userList.add(users);
            // TODO: Handle this case.
            break;
          case DocumentChangeType.removed:
            userList.removeWhere((element) => element.id == users.id);
            // TODO: Handle this case.
            break;
        }
      }
    });
  }
}
