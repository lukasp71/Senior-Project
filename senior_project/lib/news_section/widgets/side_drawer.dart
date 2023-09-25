import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:senior_project/news_section/constants/constants.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';

Drawer sideDrawer(NewsController newsController) {
  return Drawer(
    backgroundColor: AppColors.lightGrey,
    child: ListView(
      children: <Widget>[
        // Existing code for country, category, and channel selection

        /// Link to Education Section
        ListTile(
          title: const Text("Education Section"),
          onTap: () {
            // Navigate to the education section
            // Replace '/education' with the appropriate route for the education section
            Get.offAllNamed('/education');
          },
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

        /// Sign-In Button
        ListTile(
          title: const Text("Sign In"),
          onTap: () {
            // Navigate to the sign-in screen
            // Replace '/sign-in' with the appropriate route for the sign-in screen
            Get.offAllNamed('/sign-in');
          },
        ),
      ],
    ),
  );
}
