import 'package:flutter/material.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';
import 'package:senior_project/education_section/screens/education_module_overview.dart';

void main() => runApp(EducationHomePage());

class EducationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cybersecurity Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100], // You can adjust this color
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/education.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Interested about Learning More on CyberSecurity and keeping yourself safe? We have a set of modules ready for you to learn and study.',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .white), // Added white color for better visibility
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Pick the Category that best fits you and/or your clients:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors
                          .white), // Added white color for better visibility
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ModulePage()),
                    );
                  },
                  child: const CyberSecurityCategory("Cybersecurity for You"),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusinessModulePage()),
                    );
                    // Add your navigation logic here for the second category
                  },
                  child: const CyberSecurityCategory("Cybersecurity for Businesses"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CyberSecurityCategory extends StatelessWidget {
  final String title;

  const CyberSecurityCategory(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // Slightly transparent
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black), // Set text color to black for visibility
      ),
    );
  }
}
