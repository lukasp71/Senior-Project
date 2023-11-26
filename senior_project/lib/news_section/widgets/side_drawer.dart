/*import 'package:flutter/material.dart';
import 'package:senior_project/database/models/user.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/database/services/databse.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/screens/home_page.dart';
import 'package:senior_project/news_section/widgets/user_profile_page.dart';
import 'package:senior_project/vulnerability_section/vulnerability_page.dart';

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
              // User is authenticated
              Users user = snapshot.data as Users;
              String uidString = user.uid ?? "";
              DatabaseService service = DatabaseService(uid: uidString);

              return FutureBuilder<List<String>>(
                future: Future.wait([
                  service.getUserUsername(),
                  service.getUserEmail(),
                ]),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    String username = asyncSnapshot.data![0];
                    String email = asyncSnapshot.data![1];
                    return UserAccountsDrawerHeader(
                      accountName: Text(username), // Display the user's name
                      accountEmail: Text(email), // Display the user's email
                      currentAccountPicture: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfilePage(
                                  parentContext: context, snapshot: snapshot),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Display loading or default content while the data is being fetched
                    return UserAccountsDrawerHeader(
                      accountName: const Text("Loading..."),
                      accountEmail: const Text("Loading..."),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    );
                  }
                },
              );
            } else {
              // User is not authenticated
              return const UserAccountsDrawerHeader(
                accountName: Text('username'), // Default name
                accountEmail: Text('email'), // Default email
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              );
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
*/