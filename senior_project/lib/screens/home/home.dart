import 'package:flutter/material.dart';
import 'package:senior_project/screens/info/education_section.dart'; // Import your Cyber News screen
import 'package:senior_project/screens/info/cyber_news.dart'; // Import your Recent Threats screen
import 'package:senior_project/screens/info/recent_threats.dart'; // Import your Education Sections screen
import 'package:senior_project/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('Log Out'),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Cyber News'),
              Tab(text: 'Recent Threats'),
              Tab(text: 'Education Sections'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CyberNewsScreen(), // Your Cyber News screen widget
            RecentThreatsScreen(), // Your Recent Threats screen widget
            EducationSectionsScreen(), // Your Education Sections screen widget
          ],
        ),
      ),
    );
  }
}
