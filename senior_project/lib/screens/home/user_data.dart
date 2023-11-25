
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:senior_project/database/models/userinfo.dart';
import "package:senior_project/screens/home/user_title.dart";

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _userDataState();
}

class _userDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<UserInformation>?>(context);

    return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return UserTitle(
            title: data[index],
          );
        });
  }
}
