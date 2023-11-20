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

  Future<String> getUserUsername() async {
    try {
      DocumentSnapshot snapshot = await collection.doc(uid).get();
      if (snapshot.exists && snapshot.data() != null) {
        var userData = snapshot.data() as Map<String, dynamic>;
        return userData['name'] ??
            'Unknown'; // Return 'Unknown' if name is not found
      } else {
        return 'Unknown'; // Return 'Unknown' if document does not exist
      }
    } catch (e) {
      // Handle any errors here
      print('Error getting user data: $e');
      return 'Error'; // Return 'Error' or any other appropriate default value
    }
  }

  Future<String> getUserEmail() async {
    try {
      DocumentSnapshot snapshot = await collection.doc(uid).get();
      if (snapshot.exists && snapshot.data() != null) {
        var userData = snapshot.data() as Map<String, dynamic>;
        return userData['email'] ??
            'Unknown'; // Return 'Unknown' if name is not found
      } else {
        return 'Unknown'; // Return 'Unknown' if document does not exist
      }
    } catch (e) {
      // Handle any errors here
      print('Error getting user data: $e');
      return 'Error'; // Return 'Error' or any other appropriate default value
    }
  }

  Future<void> updateModuleProgress(
      String moduleId, Map<String, dynamic> moduleData) async {
    return await collection.doc(uid).update({'modules.$moduleId': moduleData});
  }
}
