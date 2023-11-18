import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/database/models/user.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/database/services/databse.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/screens/home_page.dart';
import 'package:senior_project/vulnerability_section/vulnerability_page.dart';
import 'package:senior_project/database/models/userinfo.dart';

Drawer sideDrawer(BuildContext context, NewsController newsController) {
  final AuthService _authService = AuthService(); // Initialize your AuthService

  return Drawer(
    backgroundColor: Colors.blue, // Change the background color
    child: ListView(
      children: <Widget>[
        StreamBuilder(
          stream: _authService.user, // listening to the user stream
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              // This means the user is authenticated
              Users user = snapshot.data as Users;
              String? uid = user.uid;
              String uidString = "";
              if (uid != null) {
                uidString = uid;
              }
              DatabaseService service = DatabaseService(uid: uidString);
              //List<UserInformation> userinfo = service
              //    .userDatafromSnapshot(snapshot as QuerySnapshot<Object?>);
              return UserAccountsDrawerHeader(
                accountName:
                    Text(uidString ?? "User"), // Replace with the user's name
                accountEmail: Text(uidString ??
                    "email@example.com"), // Replace with the user's email
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              );
            } else {
              return const UserAccountsDrawerHeader(
                accountName: Text('username'), // Replace with the user's name
                accountEmail: Text('email'), // Replace with the user's email
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              );
              // This means the user is not authenticated
            }
          },
        ),
        ListTile(
          title: const Text("Education Section"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EducationHomePage()),
            );
          },
        ),
        ListTile(
          title: const Text("News Section"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        ListTile(
          title: const Text("Vulnerability Section"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VulnerabilityPage()),
            );
          },
        ),
        const Divider(),
        ListTile(
          title: const Text("Sign Out"),
          onTap: () {
            _authService.signOut(); // Add sign-out functionality
          },
        ),
      ],
    ),
  );
}
