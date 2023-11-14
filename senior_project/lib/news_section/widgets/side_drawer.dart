import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/screens/home_page.dart';
import 'package:senior_project/vulnerability_section/vulnerability_page.dart';

Drawer sideDrawer(BuildContext context, NewsController newsController) {
  final AuthService _authService = AuthService(); // Initialize your AuthService

  return Drawer(
    backgroundColor: const Color.fromARGB(255, 0, 94, 172), // Change the background color
    child: ListView(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          accountName: Text("John Doe"), // Replace with the user's name
          accountEmail:
              Text("john.doe@example.com"), // Replace with the user's email
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
            color: Color.fromARGB(255, 0, 94, 172),
              size: 40,
            ),
          ),
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
