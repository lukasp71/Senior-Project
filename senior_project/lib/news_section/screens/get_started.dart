import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/firebase_options.dart';
import 'package:senior_project/database/screens/authenticate/authenticate.dart';
import 'package:senior_project/database/screens/authenticate/sign_in.dart';
import 'package:senior_project/database/screens/authenticate/register.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(
          title: 'Cybersecurity News and Education Application V2023'),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void showSignIn() {
    Navigator.of(context).pop(); // Close the get_started popup
    showDialog(
      context: context,
      builder: (context) => Authenticate(),
    );
  }

  void showRegister() {
    Navigator.of(context).pop(); // Close the get_started popup
    showDialog(
      context: context,
      builder: (context) => Authenticate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/flashNews.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Welcome to the Threat Awareness Hub.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'This is a new application designed to help everyone learn and improve their cybersecurity knowledge.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You can also stay up to date with the latest cybersecurity events going on.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: showSignIn,
                  child: const Text('Login With Current Account'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: showRegister,
                  child: const Text('Register a New Account'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                  child: const Text('Login as a Guest'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
