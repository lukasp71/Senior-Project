import 'package:flutter/material.dart';
import 'package:senior_project/database/screens/authenticate/authenticate.dart';
import 'package:senior_project/database/screens/authenticate/register_authenticate.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showSignIn() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Authenticate()));
    }

    void showRegister() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const RegisterAuthenticate()));
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.50, // Adjust the width as needed
        height: MediaQuery.of(context).size.height *
            0.40, // Adjust the height as needed
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/flashNews.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome to the Threat Awareness Hub',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Stay informed and protected in the digital world! Our app brings you the latest in cybersecurity news, recent vulnerability updates, and comprehensive learning modules.',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Whether you\'re an individual user or a business, our resources are tailored to enhance your cybersecurity awareness and defenses.',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showSignIn,
              child: const Text('Login With Current Account'),
            ),
            ElevatedButton(
              onPressed: showRegister,
              child: const Text('Register a New Account'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), // Close the popup
              child: const Text('Continue as a Guest'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
