import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/screens/home_page.dart';
import 'package:senior_project/news_section/widgets/user_profile_page.dart';
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

  FirebaseAuth user = FirebaseAuth.instance;

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
        PopupMenuButton<String>(
          onSelected: (String result) {
            // Handle the selection
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfilePage()));
                }),
            PopupMenuItem<String>(
              value: 'SignOut',
              child: Text('Sign Out'),
              onTap: () {
                user.signOut();
              },
            ),
          ],
          icon: Icon(Icons.person, color: Colors.white), // User profile icon
        ),
      ],
    );
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
