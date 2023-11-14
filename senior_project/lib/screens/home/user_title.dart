import "package:flutter/material.dart";
import 'package:senior_project/database/models/userinfo.dart';

class UserTitle extends StatelessWidget {
  late final UserInformation title;
  UserTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[title.progress],
          ),
          title: Text(title.name),
        ),
      ),
    );
  }
}
