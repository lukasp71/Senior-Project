import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:senior_project/database/models/userinfo.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('User');
  Future updateUserData(
      String name,
      String email,
      int introModuleQuizScore,
      int malwareModuleQuizScore,
      int threatModuleQuizScore,
      int iotAIModuleQuizScore,
      int cyberLawModuleQuizScore,
      int ethicalHackingModuleQuizScore) async {
    return await collection.doc(uid).set({
      'name': name,
      'email': email,
      'introModuleQuizScore': introModuleQuizScore,
      'malwareModuleQuizScore': malwareModuleQuizScore,
      'threatModuleQuizScore': threatModuleQuizScore,
      'iotAIModuleQuizScore': iotAIModuleQuizScore,
      'cyberLawModuleQuizScore': cyberLawModuleQuizScore,
      'ethicalHackingModuleQuizScore': ethicalHackingModuleQuizScore
    });
  }

  // user data from snapshot
  List<UserInformation> userDatafromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map<UserInformation>((doc) {
      return UserInformation(
          name: doc.get('name') ?? '',
          email: doc.get('email'),
          introModuleQuizScore: doc.get('introModuleQuizScore'),
          malwareModuleQuizScore: doc.get('malwareModuleQuizScore'),
          threatModuleQuizScore: doc.get('threatModuleQuizScore'),
          iotAIModuleQuizScore: doc.get('iotAIModuleQuizScore'),
          cyberLawModuleQuizScore: doc.get('cyberLawModuleQuizScore'),
          ethicalHackingModuleQuizScore:
              doc.get('ethicalHackingModuleQuizScore'));
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

  Future<void> updateQuizScore(String moduleName, int score) async {
    return await collection
        .doc(uid)
        .update({
          '$moduleName': score, // Assuming quizzes is a map of modules
        })
        .then((value) => print("Quiz Score Updated"))
        .catchError((error) => print("Failed to update quiz score: $error"));
  }

  Future<void> updateUserFavorites(List<String> favoriteArticlesUrls) async {
    return await collection
        .doc(uid)
        .set({'favorites': favoriteArticlesUrls}, SetOptions(merge: true))
        .then((value) => print("Favorites Updated"))
        .catchError((error) => print("Failed to update favorites: $error"));
  }
}
