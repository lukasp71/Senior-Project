import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:senior_project/database/services/databse.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;
  late DatabaseService service;
  late TabController _tabController;
  bool isLoading = true; // Initially, set to true to show the loading state

  // Variables to hold user data
  String username = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    if (user != null) {
      service = DatabaseService(uid: user!.uid);
      _loadUserData();
    }
  }

  Future<void> _loadUserData() async {
    try {
      if (user != null) {
        service = DatabaseService(uid: user!.uid);
        var userData =
            await service.getUserData(); // Assuming this returns a Future
        String fetchedUsername =
            await service.getUserUsername(); // Await the Future<String>
        String fetchedEmail =
            await service.getUserEmail(); // Await the Future<String>

        setState(() {
          username = fetchedUsername;
          email = fetchedEmail;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
      // Handle the error state
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: SectionAppBar(currentSection: 'Profile'),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Profile'),
                    Tab(text: 'Quiz Scores'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildProfileTab(),
                    _buildQuizScoresTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildProfileTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile Settings',
            style: TextStyle(
                color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.red),
          _buildTextFormField('Username', username),
          _buildTextFormField('Email', email),
          // Add more profile fields if necessary
        ],
      ),
    );
  }

  Widget _buildQuizScoresTab() {
    // Replace with your quiz scores UI
    return Center(
      child: Text('Quiz Scores will be displayed here'),
    );
  }

  Widget _buildTextFormField(String label, String initialValue,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
