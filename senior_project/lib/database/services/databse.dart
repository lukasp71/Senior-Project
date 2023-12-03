// ignore_for_file: avoid_print

import "package:cloud_firestore/cloud_firestore.dart";
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
      int defaultUserScore,
      bool defaultQuizProgress,
      List<String> favURLs,
      List<String> savedTitles,
      String pfpURL) async {
    return await collection.doc(uid).set({
      'name': name,
      'email': email,
      'userQuiz1Score': defaultUserScore,
      'userQuiz2Score': defaultUserScore,
      'userQuiz3Score': defaultUserScore,
      'userQuiz4Score': defaultUserScore,
      'userQuiz5Score': defaultUserScore,
      'attemptUserQuiz1': defaultQuizProgress,
      'attemptUserQuiz2': defaultQuizProgress,
      'attemptUserQuiz3': defaultQuizProgress,
      'attemptUserQuiz4': defaultQuizProgress,
      'attemptUserQuiz5': defaultQuizProgress,
      'businessQuiz1Score': defaultUserScore,
      'businessQuiz2Score': defaultUserScore,
      'businessQuiz3Score': defaultUserScore,
      'businessQuiz4Score': defaultUserScore,
      'businessQuiz5Score': defaultUserScore,
      'businessQuiz6Score': defaultUserScore,
      'attemptBusinessQuiz1': defaultQuizProgress,
      'attemptBusinessQuiz2': defaultQuizProgress,
      'attemptBusinessQuiz3': defaultQuizProgress,
      'attemptBusinessQuiz4': defaultQuizProgress,
      'attemptBusinessQuiz5': defaultQuizProgress,
      'attemptBusinessQuiz6': defaultQuizProgress,
      'favURLs': favURLs,
      'savedTitles': savedTitles,
      'pfpURL': pfpURL
    });
  }

  // user data from snapshot
  List<UserInformation> userDatafromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map<UserInformation>((doc) {
      return UserInformation(
        name: doc.get('name') ?? '',
        email: doc.get('email'),
        userQuiz1Score: doc.get('userQuiz1Score'),
        userQuiz2Score: doc.get('userQuiz1Score'),
        userQuiz3Score: doc.get('userQuiz1Score'),
        userQuiz4Score: doc.get('userQuiz1Score'),
        userQuiz5Score: doc.get('userQuiz1Score'),
        attemptUserQuiz1: doc.get('attemptUserQuiz1'),
        attemptUserQuiz2: doc.get('attemptUserQuiz2'),
        attemptUserQuiz3: doc.get('attemptUserQuiz3'),
        attemptUserQuiz4: doc.get('attemptUserQuiz4'),
        attemptUserQuiz5: doc.get('attemptUserQuiz5'),
        businessQuiz1Score: doc.get('businessQuiz1Score'),
        businessQuiz2Score: doc.get('businessQuiz2Score'),
        businessQuiz3Score: doc.get('businessQuiz3Score'),
        businessQuiz4Score: doc.get('businessQuiz4Score'),
        businessQuiz5Score: doc.get('businessQuiz5Score'),
        businessQuiz6Score: doc.get('businessQuiz6Score'),
        attemptBusinessQuiz1: doc.get('attemptBusinessQuiz1'),
        attemptBusinessQuiz2: doc.get('attemptBusinessQuiz2'),
        attemptBusinessQuiz3: doc.get('attemptBusinessQuiz3'),
        attemptBusinessQuiz4: doc.get('attemptBusinessQuiz4'),
        attemptBusinessQuiz5: doc.get('attemptBusinessQuiz5'),
        attemptBusinessQuiz6: doc.get('attemptBusinessQuiz6'),
        favURLs: doc.get('favURLs'),
        savedTitles: doc.get('savedTitles'),
        pfpURL: doc.get('pfpURL'),
      );
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
          moduleName: score, // Assuming quizzes is a map of modules
        })
        .then((value) => print("Quiz Score Updated"))
        .catchError((error) => print("Failed to update quiz score: $error"));
  }

  Future<void> updateQuizProgress(String moduleName, bool flag) async {
    return await collection
        .doc(uid)
        .update({
          moduleName: flag, // Assuming quizzes is a map of modules
        })
        .then((value) => print("Quiz Score Updated"))
        .catchError((error) => print("Failed to update quiz score: $error"));
  }

  Future<void> updateUsername(String newUsername) async {
    return await collection
        .doc(uid)
        .update({'name': newUsername})
        .then((value) => print("Username Updated"))
        .catchError((error) => print("Failed to update quiz score: $error"));
  }

  Future<void> updateEmail(String newEmail) async {
    return await collection
        .doc(uid)
        .update({'email': newEmail})
        .then((value) => print("Email Updated"))
        .catchError((error) => print("Failed to update quiz score: $error"));
  }

  Future<int> getQuizScore(String moduleName) async {
    try {
      DocumentSnapshot snapshot = await collection.doc(uid).get();
      if (snapshot.exists && snapshot.data() != null) {
        var userData = snapshot.data() as Map<String, dynamic>;
        return userData[moduleName] ??
            'Unknown'; // Return 'Unknown' if name is not found
      } else {
        return 0; // Return 'Unknown' if document does not exist
      }
    } catch (e) {
      // Handle any errors here
      print('Error getting user data: $e');
      return 0; // Return 'Error' or any other appropriate default value
    }
  }

  Future<bool> getQuizProgress(String moduleName) async {
    try {
      DocumentSnapshot snapshot = await collection.doc(uid).get();
      if (snapshot.exists && snapshot.data() != null) {
        var userData = snapshot.data() as Map<String, dynamic>;
        return userData[moduleName] ??
            'Unknown'; // Return 'Unknown' if name is not found
      } else {
        return false; // Return 'Unknown' if document does not exist
      }
    } catch (e) {
      // Handle any errors here
      print('Error getting user data: $e');
      return false; // Return 'Error' or any other appropriate default value
    }
  }

  Future<List<String>> getFavURLs() async {
    try {
      DocumentSnapshot snapshot = await collection.doc(uid).get();
      if (snapshot.exists && snapshot.data() != null) {
        var userData = snapshot.data() as Map<String, dynamic>;
        return (userData['favURLs'] as List<dynamic>).cast<String>();
      } else {
        return ['Error'];
      }
    } catch (e) {
      print('Error getting user data: $e');
      return ['Error'];
    }
  }

  Future<List<String>> getsavedTitles() async {
    try {
      DocumentSnapshot snapshot = await collection.doc(uid).get();
      if (snapshot.exists && snapshot.data() != null) {
        var userData = snapshot.data() as Map<String, dynamic>;
        return (userData['savedTitles'] as List<dynamic>).cast<String>();
      } else {
        return ['Error'];
      }
    } catch (e) {
      print('Error getting user data: $e');
      return ['Error'];
    }
  }
}
