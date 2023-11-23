import 'package:flutter/material.dart';
import 'package:senior_project/database/services/auth.dart';
import 'package:senior_project/education_section/screens/education_home_page.dart';
import 'package:senior_project/news_section/screens/home_page.dart';
import 'package:senior_project/vulnerability_section/vulnerability_page.dart';

class SectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AuthService _authService = AuthService();
  @override
  final Size preferredSize;
  final String currentSection;

  SectionAppBar({
    Key? key,
    required this.currentSection,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

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
            const PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile'),
            ),
            const PopupMenuItem<String>(
              value: 'SignOut',
              child: Text('Sign Out'),
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
          _authService.signOut();
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
