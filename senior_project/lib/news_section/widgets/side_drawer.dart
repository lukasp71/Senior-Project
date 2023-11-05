import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/constants/constants.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/screens/home_page.dart';

Drawer sideDrawer(BuildContext context, NewsController newsController) {
  final AuthService _authService = AuthService(); // Initialize your AuthService

  return Drawer(
    backgroundColor: AppColors.lightGrey,
    child: ListView(
      children: <Widget>[
        /// Link to Education Section
        ListTile(
          title: const Text("Education Section"),
          onTap: () => Navigator.push(
            context as BuildContext,
            MaterialPageRoute(builder: (context) => EducationHomePage()),
          ),
        ),
        ListTile(
          title: const Text("News Section"),
          onTap: () => Navigator.push(
              context as BuildContext, HomePage() as Route<Object?>),
        ),

        /// Link to Vulnerability Section
        ListTile(
          title: const Text("Vulnerability Section"),
          onTap: () {
            // Navigate to the vulnerability section
            // Replace '/vulnerability' with the appropriate route for the vulnerability section
            Get.offAllNamed('/vulnerability');
          },
        ),

        const Divider(),

        // Using StreamBuilder to listen to authentication state
      ],
    ),
  );
}
