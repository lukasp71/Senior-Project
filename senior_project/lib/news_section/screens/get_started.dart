import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/database/firebase_options.dart';
import 'package:senior_project/database/screens/authenticate/sign_in.dart';
import 'package:senior_project/database/screens/authenticate/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WelcomePage());
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(
        title: 'Cybersecurity News and Education Application V2023',
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key, required this.title});

  final String title;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSignInSelected = false;

  void toggleView() {
    setState(() {
      isSignInSelected = !isSignInSelected;
    });
  }

  void moveToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => isSignInSelected
            ? SignIn(toggleView: toggleView)
            : Register(toggleView: toggleView),
      ),
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
          const Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Welcome to the Threat Awareness Hub.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'This is a new application designed to help everyone learn and improve their cybersecurity knowledge.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'You can also stay up to date with the latest cybersecurity events going on.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    toggleView();
                    moveToNextScreen();
                  },
                  child: const Text('Login With Current Account'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    toggleView();
                    moveToNextScreen();
                  },
                  child: const Text('Register a New Account'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    moveToNextScreen();
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
