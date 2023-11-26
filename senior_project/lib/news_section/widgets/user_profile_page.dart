import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:senior_project/database/services/databse.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  User? user = FirebaseAuth.instance.currentUser;
  late DatabaseService service;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      service = DatabaseService(uid: user!.uid);
    }
    _loadUserData();
  }

  void _loadUserData() async {
    setState(() => isLoading = true);
    String username = await service.getUserUsername();
    String email = await service.getUserEmail();
    setState(() {
      usernameController.text = username;
      emailController.text = email;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile Settings',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.red),
              _buildTextFormField('Username', usernameController as String),
              _buildTextFormField('Email', emailController as String),
              _buildTextFormField('First Name', 'Luke'),
              _buildTextFormField('Last Name', 'Perri'),
              SizedBox(
                  height: 24), // Space between profile and security settings
              Text(
                'Security Settings',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.red),
              _buildTextFormField('Current Password', '••••••••••',
                  obscureText: true),
              // Add more fields if necessary
            ],
          ),
        ),
      ),
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
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
