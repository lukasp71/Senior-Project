import "package:flutter/material.dart";
import 'package:senior_project/database/screens/authenticate/register.dart';
import 'package:senior_project/database/screens/authenticate/sign_in.dart';

class RegisterAuthenticate extends StatefulWidget {
  const RegisterAuthenticate({super.key});

  @override
  State<RegisterAuthenticate> createState() => _Authenticate();
}

class _Authenticate extends State<RegisterAuthenticate> {
  bool showSignIn = true;
  toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Register(toggleView: toggleView);
    } else {
      return SignIn(toggleView: toggleView);
    }
  }
}
