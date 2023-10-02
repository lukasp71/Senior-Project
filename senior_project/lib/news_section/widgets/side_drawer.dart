import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:senior_project/database/screens/authenticate/authenticate.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/constants/constants.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/utils/utils.dart';

Drawer sideDrawer(BuildContext context, NewsController newsController) {
  return Drawer(
    backgroundColor: AppColors.lightGrey,
    child: ListView(
      children: <Widget>[
        // Existing code for country, category, and channel selection

        /// Link to Education Section
        ListTile(
          title: const Text("Education Section"),
          onTap: () => Navigator.push(
            context as BuildContext,
            MaterialPageRoute(builder: (context) => EducationHomePage()),
          ),
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
        ListTile(
          title: const Text("Sign in"),
          onTap: () {
            // Navigate to the Authenticate screen
            Get.to(() => Authenticate());
          },
        )
      ],
    ),
  );
}
