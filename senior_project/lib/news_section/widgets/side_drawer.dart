import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:senior_project/database/models/user.dart';
import 'package:senior_project/database/screens/authenticate/authenticate.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/constants/constants.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/utils/utils.dart';

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
        StreamBuilder(
          stream: _authService.user, // listening to the user stream
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              // This means the user is authenticated
              Users user = snapshot.data as Users;
              return ListTile(
                title: Text(user.uid ?? 'User'), // Display the username
                onTap: () {
                  // You can navigate the user to their profile page or any other action
                },
              );
            } else {
              // This means the user is not authenticated
              return ListTile(
                title: const Text("Sign in"),
                onTap: () => Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(builder: (context) => Authenticate()),
                ),
              );
            }
          },
        ),
      ],
    ),
  );
}
