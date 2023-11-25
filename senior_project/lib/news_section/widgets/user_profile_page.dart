import 'package:flutter/material.dart';
import 'package:senior_project/database/models/user.dart';
import 'package:senior_project/database/services/databse.dart';

class UserProfilePage extends StatefulWidget {
  final BuildContext parentContext;
  final AsyncSnapshot<Users?> snapshot;

  UserProfilePage(
      {Key? key, required this.parentContext, required this.snapshot})
      : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late DatabaseService databaseService;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Users user = widget.snapshot.data!;
    String uidString = user.uid ?? "";
    databaseService = DatabaseService(uid: uidString);
    usernameController = TextEditingController();
    emailController = TextEditingController();
    _loadUserData();
  }

  void _loadUserData() async {
    setState(() => isLoading = true);
    String username = await databaseService.getUserUsername();
    String email = await databaseService.getUserEmail();
    setState(() {
      usernameController.text = username;
      emailController.text = email;
      isLoading = false;
    });
  }

  void _updateProfile() {
    // Implement update logic and show Snackbar on success or error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildProfileField(usernameController, "Username"),
                  const SizedBox(height: 20),
                  _buildProfileField(emailController, "Email"),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _updateProfile,
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child:
                        const Text("Update Profile", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }
}
