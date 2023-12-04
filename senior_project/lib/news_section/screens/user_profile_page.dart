// ignore_for_file: library_private_types_in_public_api, avoid_print, avoid_unnecessary_containers, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:senior_project/database/services/databse.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;
  late DatabaseService service;
  late TabController _tabController;
  bool isLoading = true; // Initially, set to true to show the loading state
  late DocumentReference userRef;
  // Variables to hold user data
  String username = '';
  String email = '';
  List<String> favURLs = [];
  List<String> savedTitles = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    if (user != null) {
      service = DatabaseService(uid: user!.uid);
      _loadUserData();
    }
  }

  Future<void> _loadUserData() async {
    try {
      if (user != null) {
        service = DatabaseService(uid: user!.uid);
        String fetchedUsername = await service.getUserUsername();
        String fetchedEmail = await service.getUserEmail();
        List<String> fetchedURLs = await service.getFavURLs();
        List<String> fetchedTitles = await service.getsavedTitles();
        userRef = FirebaseFirestore.instance.collection('User').doc(user!.uid);
        setState(() {
          username = fetchedUsername;
          email = fetchedEmail;
          favURLs = fetchedURLs;
          savedTitles = fetchedTitles;
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
        appBar: SectionAppBar(currentSection: 'Profile', backArrow: true),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.white,
                  tabs: const [
                    Tab(text: 'Profile'),
                    Tab(text: 'Quiz Scores'),
                    Tab(text: 'Saved Articles/Vulnerabilities'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildProfileTab(),
                    _buildQuizScoresTab(),
                    _buildFavoritesTab(),
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
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), 
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Profile Settings',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 16),
            _buildStyledTextField(
              'Username',
              username,
              onChanged: (value) => username = value,
              icon: Icons.person,
            ),
            _buildStyledTextField(
              'New Email',
              email,
              controller: emailController,
              icon: Icons.email,
              validator: (value) => value != null && !value.contains('@')
                  ? 'Enter a valid email'
                  : null,
            ),
            _buildStyledTextField(
              'New Password',
              '',
              controller: passwordController,
              icon: Icons.lock,
              isPassword: true,
              validator: (value) => value != null && value.length < 6
                  ? 'Password must be at least 6 characters'
                  : null,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool emailUpdated =
                          await updateEmail(emailController.text);
                      bool passwordUpdated =
                          await updatePassword(passwordController.text);

                      if (emailUpdated && passwordUpdated) {
                        _showMessage('Profile updated successfully');
                        await service.updateEmail(emailController.text);
                        await service.updateUsername(username);
                      } else {
                        // Individual error messages are already shown by the update methods
                      }
                    }
                  },
                  child: const Text('Update Profile'),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledTextField(
    String label,
    String initialValue, {
    TextEditingController? controller,
    IconData? icon,
    bool isPassword = false,
    Function(String)? onChanged,
    String? Function(String?)? validator, // Add validator parameter
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        initialValue: controller == null ? initialValue : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        obscureText: isPassword,
        onChanged: onChanged,
        validator: validator, // Use the validator in TextFormField
      ),
    );
  }

  Widget _buildStyledButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  Widget _buildQuizScoresTab() {
    return const Center(
      child: Text('Quiz Scores will be displayed here'),
    );
  }

  Widget _buildFavoritesTab() {
    TextEditingController searchController = TextEditingController();
    List<String> filteredTitles =
        List.from(savedTitles); // Initialize with all titles

    void filterSearchResults(String query) {
      if (query.isEmpty) {
        setState(() {
          filteredTitles = List.from(savedTitles);
        });
        return;
      }

      List<String> tempList = [];
      for (String title in savedTitles) {
        if (title.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(title);
        }
      }

      setState(() {
        filteredTitles = tempList;
      });
    }

    Future<void> _showDeleteConfirmation(int index) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // User must tap button to dismiss
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Removal'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to remove this article?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Remove'),
                onPressed: () async {
                  setState(() {
                    int originalIndex =
                        savedTitles.indexOf(filteredTitles[index]);
                    favURLs.removeAt(originalIndex);
                    savedTitles.removeAt(originalIndex);
                    filteredTitles.removeAt(index);

                    // Also, update this change in your database
                  });
                  Navigator.of(context).pop();
                  await userRef.update({'favURLs': favURLs});
                  await userRef.update({'savedTitles': savedTitles});
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Saved Articles/Vulnerabilities',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.white),
          TextField(
            onChanged: filterSearchResults,
            controller: searchController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black,
              labelText: "Search",
              labelStyle: TextStyle(color: Colors.white),
              hintText: "Search in saved articles",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTitles.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[850],
                  child: ListTile(
                    title: Text(
                      filteredTitles[
                          index], // Display the filtered article title
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      favURLs[savedTitles.indexOf(filteredTitles[
                          index])], // Display the corresponding URL
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _showDeleteConfirmation(index),
                    ),
                    onTap: () async {
                      // Handle URL click (e.g., open the article)
                      String url =
                          favURLs[savedTitles.indexOf(filteredTitles[index])];
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('Could not launch $url');
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
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
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Future<bool> updateEmail(String newEmail) async {
    try {
      await user!.updateEmail(newEmail);
      await user!.reload();
      user = FirebaseAuth.instance.currentUser;
      return true; // Success
    } catch (e) {
      _showMessage('Error updating email: $e'); // Show error message
      return false; // Failure
    }
  }

  Future<bool> updatePassword(String newPassword) async {
    try {
      await user!.updatePassword(newPassword);
      return true; // Success
    } catch (e) {
      _showMessage('Error updating password: $e'); // Show error message
      return false; // Failure
    }
  }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
