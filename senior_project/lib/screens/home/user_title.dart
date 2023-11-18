import 'package:flutter/material.dart';
import 'package:senior_project/database/models/userinfo.dart';

class UserTitle extends StatelessWidget {
  final UserInformation title;

  UserTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    // Example calculation of completed modules
    int completedModules = title.moduleProgress.values
        .where((module) => module['completed'] as bool)
        .length;

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[
                completedModules], // Change this to reflect your design needs
          ),
          title: Text(title.name),
          subtitle: Text(
              'Completed Modules: $completedModules'), // Displaying the number of completed modules
        ),
      ),
    );
  }
}
