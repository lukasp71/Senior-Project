import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:senior_project/database/models/userinfo.dart';
import 'package:senior_project/database/services/databse.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assuming you have a way to get the current user's UID
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final DatabaseService databaseService = DatabaseService(uid: currentUserId);

    return StreamBuilder<List<UserInformation>>(
      stream: databaseService.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text("No user data available");
        }

        UserInformation userInfo = snapshot.data!.first;
        return Column(
          children: <Widget>[
            Text("Name: ${userInfo.name}"),
            Text("Email: ${userInfo.email}"),
            // You can add more fields here as needed
          ],
        );
      },
    );
  }
}
