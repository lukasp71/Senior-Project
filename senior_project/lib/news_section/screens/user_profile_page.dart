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
  bool isLoading = true;

  late DocumentReference userRef;
  String username = '';
  String email = '';
  int userQuiz1Score = 0;
  int userQuiz2Score = 0;
  int userQuiz3Score = 0;
  int userQuiz4Score = 0;
  int userQuiz5Score = 0;
  bool attemptUserQuiz1 = false;
  bool attemptUserQuiz2 = false;
  bool attemptUserQuiz3 = false;
  bool attemptUserQuiz4 = false;
  bool attemptUserQuiz5 = false;
  int businessQuiz1Score = 0;
  int businessQuiz2Score = 0;
  int businessQuiz3Score = 0;
  int businessQuiz4Score = 0;
  int businessQuiz5Score = 0;
  int businessQuiz6Score = 0;
  bool attemptBusinessQuiz1 = false;
  bool attemptBusinessQuiz2 = false;
  bool attemptBusinessQuiz3 = false;
  bool attemptBusinessQuiz4 = false;
  bool attemptBusinessQuiz5 = false;
  bool attemptBusinessQuiz6 = false;
  List<String> favURLs = [];
  List<String> savedTitles = [];

  // Password visibility state variables
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Text editing controllers
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      if (user != null) {
        service = DatabaseService(uid: user!.uid);
        String fetchedUsername = await service.getUserUsername();
        String fetchedEmail = await service.getUserEmail();
        List<String> fetchedURLs = await service.getFavURLs();
        List<String> fetchedTitles = await service.getsavedTitles();
        int fetchedUserQuiz1Score =
            await service.getQuizScore('userQuiz1Score');
        int fetchedUserQuiz2Score =
            await service.getQuizScore('userQuiz2Score');
        int fetchedUserQuiz3Score =
            await service.getQuizScore('userQuiz3Score');
        int fetchedUserQuiz4Score =
            await service.getQuizScore('userQuiz4Score');
        int fetchedUserQuiz5Score =
            await service.getQuizScore('userQuiz5Score');
        bool fetchedAttemptUserQuiz1 =
            await service.getQuizProgress('attemptUserQuiz1');
        bool fetchedAttemptUserQuiz2 =
            await service.getQuizProgress('attemptUserQuiz2');
        bool fetchedAttemptUserQuiz3 =
            await service.getQuizProgress('attemptUserQuiz3');
        bool fetchedAttemptUserQuiz4 =
            await service.getQuizProgress('attemptUserQuiz4');
        bool fetchedAttemptUserQuiz5 =
            await service.getQuizProgress('attemptUserQuiz5');
        int fetchedBusinessQuiz1Score =
            await service.getQuizScore('businessQuiz1Score');
        int fetchedBusinessQuiz2Score =
            await service.getQuizScore('businessQuiz2Score');
        int fetchedBusinessQuiz3Score =
            await service.getQuizScore('businessQuiz3Score');
        int fetchedBusinessQuiz4Score =
            await service.getQuizScore('businessQuiz4Score');
        int fetchedBusinessQuiz5Score =
            await service.getQuizScore('businessQuiz5Score');
        int fetchedBusinessQuiz6Score =
            await service.getQuizScore('businessQuiz6Score');
        bool fetchedAttemptBusinessQuiz1 =
            await service.getQuizProgress('attemptBusinessQuiz1');
        bool fetchedAttemptBusinessQuiz2 =
            await service.getQuizProgress('attemptBusinessQuiz2');
        bool fetchedAttemptBusinessQuiz3 =
            await service.getQuizProgress('attemptBusinessQuiz3');
        bool fetchedAttemptBusinessQuiz4 =
            await service.getQuizProgress('attemptBusinessQuiz4');
        bool fetchedAttemptBusinessQuiz5 =
            await service.getQuizProgress('attemptBusinessQuiz5');
        bool fetchedAttemptBusinessQuiz6 =
            await service.getQuizProgress('attemptBusinessQuiz6');
        userRef = FirebaseFirestore.instance.collection('User').doc(user!.uid);
        setState(() {
          username = fetchedUsername;
          email = fetchedEmail;
          favURLs = fetchedURLs;
          savedTitles = fetchedTitles;
          isLoading = false;
          userQuiz1Score = fetchedUserQuiz1Score;
          userQuiz2Score = fetchedUserQuiz2Score;
          userQuiz3Score = fetchedUserQuiz3Score;
          userQuiz4Score = fetchedUserQuiz4Score;
          userQuiz5Score = fetchedUserQuiz5Score;
          attemptUserQuiz1 = fetchedAttemptUserQuiz1;
          attemptUserQuiz2 = fetchedAttemptUserQuiz2;
          attemptUserQuiz3 = fetchedAttemptUserQuiz3;
          attemptUserQuiz4 = fetchedAttemptUserQuiz4;
          attemptUserQuiz5 = fetchedAttemptUserQuiz5;
          businessQuiz1Score = fetchedBusinessQuiz1Score;
          businessQuiz2Score = fetchedBusinessQuiz2Score;
          businessQuiz3Score = fetchedBusinessQuiz3Score;
          businessQuiz4Score = fetchedBusinessQuiz4Score;
          businessQuiz5Score = fetchedBusinessQuiz5Score;
          businessQuiz6Score = fetchedBusinessQuiz6Score;
          attemptBusinessQuiz1 = fetchedAttemptBusinessQuiz1;
          attemptBusinessQuiz2 = fetchedAttemptBusinessQuiz2;
          attemptBusinessQuiz3 = fetchedAttemptBusinessQuiz3;
          attemptBusinessQuiz4 = fetchedAttemptBusinessQuiz4;
          attemptBusinessQuiz5 = fetchedAttemptBusinessQuiz5;
          attemptBusinessQuiz6 = fetchedAttemptBusinessQuiz6;
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
      // Handle the error state
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
        backgroundColor: Colors.blue[900],
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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Center(
          // Center the content
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  0.5, // Half of the screen width
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Settings section
                Text(
                  'Profile Settings',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Divider(color: Colors.white),
                _buildReadOnlyField('Username', username),
                _buildReadOnlyField('Email', email),

                SizedBox(height: 30),
                // Update Password section
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Box border color
                    borderRadius:
                        BorderRadius.circular(10), // Box border radius
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(8.0), // Padding inside the box
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Update Your Password',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Divider(color: Colors.white),
                        _buildPasswordField(
                          'Current Password',
                          _oldPasswordController,
                          'Enter your current password',
                          isPasswordVisible: _isOldPasswordVisible,
                          togglePasswordVisibility: () {
                            setState(() =>
                                _isOldPasswordVisible = !_isOldPasswordVisible);
                          },
                        ),
                        _buildPasswordField(
                          'New Password',
                          _newPasswordController,
                          'Enter new password',
                          isPasswordVisible: _isNewPasswordVisible,
                          togglePasswordVisibility: () {
                            setState(() =>
                                _isNewPasswordVisible = !_isNewPasswordVisible);
                          },
                        ),
                        _buildPasswordField(
                          'Confirm New Password',
                          _confirmPasswordController,
                          'Confirm new password',
                          isPasswordVisible: _isConfirmPasswordVisible,
                          togglePasswordVisibility: () {
                            setState(() => _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible);
                          },
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          // Button to update password
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // Button color
                            onPrimary: Colors.blue[900], // Text color
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid
                              bool isCurrentPasswordValid =
                                  await verifyCurrentPassword(
                                      _oldPasswordController.text);
                              if (!isCurrentPasswordValid) {
                                _showMessage("Current password is incorrect",
                                    Colors.red);
                                return;
                              }

                              if (_newPasswordController.text !=
                                  _confirmPasswordController.text) {
                                _showMessage(
                                    "New passwords do not match", Colors.red);
                                return;
                              }

                              bool passwordUpdated = await updatePassword(
                                  _newPasswordController.text);
                              if (passwordUpdated) {
                                _showMessage("Password updated successfully",
                                    Colors.green);

                                // Clear the password fields
                                _oldPasswordController.clear();
                                _newPasswordController.clear();
                                _confirmPasswordController.clear();
                              } else {
                                _showMessage(
                                    "Failed to update password", Colors.red);
                              }
                            }
                          },
                          child: Text('Update Password'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[300], fontSize: 16)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 20)),
          Divider(color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildPasswordField(
    String label,
    TextEditingController controller,
    String emptyValidationMessage, {
    required bool isPasswordVisible,
    required VoidCallback togglePasswordVisibility,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[300]),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[300],
          ),
          onPressed: togglePasswordVisibility,
        ),
      ),
      style: TextStyle(color: Colors.white),
      obscureText: !isPasswordVisible,
      validator: validator,
    );
  }

  Widget _buildStyledTextField(
    String label,
    TextEditingController controller, {
    IconData? icon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.red) : null,
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorStyle: TextStyle(color: Colors.red),
        ),
        obscureText: isPassword,
        validator: validator,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _showMessage(String message, Color backgroundColor) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: backgroundColor);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildStyledButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  Widget _buildQuizScoresTab() {
    List<String> userEducationQuizzes = [
      'Intro to Cyber Security',
      'Threats and Attacks',
      'Malware',
      'Social Engineering',
      'Encryption'
    ];

    List<String> businessEducationQuizzes = [
      'AI and IOT',
      'Cyber laws',
      'Ethical Hacking',
      'Firewalls',
      'Mobile Security',
      'Employee Training'
    ];
    List<int> userEducationVariables = [
      userQuiz1Score,
      userQuiz2Score,
      userQuiz3Score,
      userQuiz4Score,
      userQuiz5Score
    ];
    List<bool> userEducatinoProgress = [
      attemptUserQuiz1,
      attemptUserQuiz2,
      attemptUserQuiz3,
      attemptUserQuiz4,
      attemptUserQuiz5
    ];
    List<int> businessEducationVariables = [
      businessQuiz1Score,
      businessQuiz2Score,
      businessQuiz3Score,
      businessQuiz4Score,
      businessQuiz5Score,
      businessQuiz6Score
    ];
    List<bool> businessEducationProgress = [
      attemptBusinessQuiz1,
      attemptBusinessQuiz2,
      attemptBusinessQuiz3,
      attemptBusinessQuiz4,
      attemptBusinessQuiz5,
      attemptBusinessQuiz6
    ];
    List<int> userQuizMaxScore = [7, 15, 15, 10, 15];
    List<int> businessQuizMaxScore = [5, 5, 6, 6, 5, 5];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Education Quizzes',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          _buildQuizList(userEducationQuizzes, userEducationVariables,
              userEducatinoProgress, userQuizMaxScore),
          const SizedBox(height: 20),
          Text(
            'Business Education Quizzes',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          _buildQuizList(businessEducationQuizzes, businessEducationVariables,
              businessEducationProgress, businessQuizMaxScore),
        ],
      ),
    );
  }

  Widget _buildQuizList(List<String> quizzes, List<int> quizScores,
      List<bool> quizProgress, List<int> maxNumAnswers) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: quizzes.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: quizProgress[index]
                ? Icon(Icons.check_circle_outline, color: Colors.green)
                : Icon(Icons.help_outline, color: Colors.orange),
            title: Text(quizzes[index], style: TextStyle(color: Colors.black)),
            subtitle: Text(
              quizProgress[index]
                  ? 'Score: ${quizScores[index]}/${maxNumAnswers[index]}'
                  : 'Not Attempted',
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
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
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.white),
          TextField(
            onChanged: filterSearchResults,
            controller: searchController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Search",
              labelStyle: TextStyle(color: Colors.black),
              hintText: "Search in saved articles",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.black),
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
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      filteredTitles[
                          index], // Display the filtered article title
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      favURLs[savedTitles.indexOf(filteredTitles[
                          index])], // Display the corresponding URL
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _showDeleteConfirmation(index),
                    ),
                    onTap: () async {
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

  Future<bool> updatePassword(String newPassword) async {
    // Assuming user is the current Firebase user
    user = FirebaseAuth.instance.currentUser;
    try {
      await user!.updatePassword(newPassword);
      return true; // Success
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to update password: $e'),
            backgroundColor: Colors.red),
      );
      return false; // Failure
    }
  }

  Future<bool> verifyCurrentPassword(String oldPassword) async {
    // Assuming user is the current Firebase user
    user = FirebaseAuth.instance.currentUser;
    var authCredentials = EmailAuthProvider.credential(
        email: user!.email!, password: oldPassword);
    try {
      var authResult =
          await user?.reauthenticateWithCredential(authCredentials);
      return authResult?.user != null;
    } catch (e) {
      return false;
    }
  }
}
