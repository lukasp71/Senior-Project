import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:senior_project/database/models/userinfo.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('User');
  Future updateUserData(String name, int progress, String email) async {
    return await collection
        .doc(uid)
        .set({'name': name, 'progress': progress, 'email': email});
  }

  // user data from snapshot
  List<UserInformation> userDatafromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map<UserInformation>((doc) {
      return UserInformation(
          name: doc.get('name') ?? '',
          moduleProgress: doc.get('modules') ?? {},
          email: doc.get('email'));
    }).toList();
  }

  //get user stream
  Stream<List<UserInformation>> getUserData() {
    return collection.snapshots().map(userDatafromSnapshot);
  }

  Future<void> updateModuleProgress(
      String moduleId, Map<String, dynamic> moduleData) async {
    return await collection.doc(uid).update({'modules.$moduleId': moduleData});
  }
}
