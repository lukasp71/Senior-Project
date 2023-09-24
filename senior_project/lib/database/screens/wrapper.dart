import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:senior_project/database/screens/authenticate/authenticate.dart';
import 'package:senior_project/database/models/user.dart';
import 'package:senior_project/news_section/screens/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    final user = Provider.of<Users?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
