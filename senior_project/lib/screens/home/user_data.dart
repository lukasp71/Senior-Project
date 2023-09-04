import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:senior_project/models/userinfo.dart";

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _userDataState();
}

class _userDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<UserInformation>>(context);
    data.forEach((UserInfo) {
      print(UserInfo.name);
      print(UserInfo.progress);
    });
    return const Placeholder();
  }
}
