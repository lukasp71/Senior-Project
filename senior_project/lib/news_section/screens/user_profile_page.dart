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
                  tabs: const [
                    Tab(text: 'Profile'),
                    Tab(text: 'Quiz Scores'),
                    Tab(text: 'Saved Articles/Vulnerbilities'),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Replace with user's actual image URL
          ),
          const SizedBox(height: 16),
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
            title: Text('Confirm Removal'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to remove this article?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Remove'),
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
                color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.red),
          TextField(
            onChanged: filterSearchResults,
            controller: searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
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
          SizedBox(height: 10),
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
                      icon: Icon(Icons.delete, color: Colors.red),
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
