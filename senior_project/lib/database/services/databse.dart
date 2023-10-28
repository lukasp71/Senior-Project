import "package:cloud_firestore/cloud_firestore.dart";
import 'package:senior_project/database/models/userinfo.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('User');
  Future updateUserData(String name, int progress) async {
    return await collection.doc(uid).set({'name': name, 'progress': progress});
  }

  // user data from snapshot
  List<UserInformation> _userDatafromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map<UserInformation>((doc) {
      return UserInformation(
          name: doc.get('name') ?? '', progress: doc.get('progress') ?? 0);
    }).toList();
  }

  //get user stream
  Stream<List<UserInformation>> get userData {
    return collection.snapshots().map(_userDatafromSnapshot);
  }
}
