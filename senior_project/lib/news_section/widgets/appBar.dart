import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/screens/wrapper.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/screens/home_page.dart';
import 'package:senior_project/news_section/screens/user_profile_page.dart';
import 'package:senior_project/vulnerability_section/vulnerability_page.dart';

// ignore: must_be_immutable
class SectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: unused_field
  final AuthService _authService = AuthService();
  @override
  final Size preferredSize;
  final String currentSection;

  SectionAppBar({
    Key? key,
    required this.currentSection,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 94, 172), // Dark blue color
      elevation: 0,
      title: Text(
        'Threat Awareness Hub',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        _buildSectionButton(context, 'News', currentSection == 'News'),
        _buildSectionButton(
            context, 'Vulnerabilities', currentSection == 'Vulnerabilities'),
        _buildSectionButton(
            context, 'Education', currentSection == 'Education'),
        _buildUserAction(context),
      ],
    );
  }

  Widget _buildUserAction(BuildContext context) {
    if (auth.currentUser != null) {
      // User is logged in
      return PopupMenuButton<String>(
        onSelected: (String result) {
          // Handle the selection
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()));
              }),
          PopupMenuItem<String>(
            value: 'SignOut',
            child: Text('Sign Out'),
            onTap: () {
              auth.signOut();

              // Reload the current page by replacing it with itself
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    if (currentSection == 'News') {
                      return HomePage();
                    } else if (currentSection == 'Vulnerabilities') {
                      return VulnerabilityPage();
                    } else if (currentSection == 'Education') {
                      return EducationHomePage();
                    } else {
                      // Handle other cases or return a default page
                      return HomePage();
                    }
                  },
                ),
              );
            },
          ),
        ],
        icon: Icon(Icons.person, color: Colors.white), // User profile icon
      );
    } else {
      // User is not logged in
      return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wrapper()));
        },
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white, // You can change the text color here
            fontWeight: FontWeight.bold, // Optional: for bold text
          ),
        ),
      );
    }
  }

  Widget _buildSectionButton(
      BuildContext context, String title, bool isSelected) {
    return TextButton(
      onPressed: () {
        if (title == 'News' && currentSection != 'News') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (title == 'Vulnerabilities' &&
            currentSection != 'Vulnerabilities') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VulnerabilityPage()),
          );
        } else if (title == 'Education' && currentSection != 'Education') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EducationHomePage()),
          );
        } else {
          ;
        }
      },
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Color.fromARGB(255, 177, 138, 206) : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
