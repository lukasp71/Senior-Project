import 'package:flutter/material.dart';
import 'package:senior_project/education_section/screens/business_module_overview.dart';
import 'package:senior_project/education_section/screens/education_module_overview.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';

class EducationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Education Homepage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppBar(currentSection: 'Education', backArrow: false),
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
                  'Welcome to the Threat Awareness Hub Education Section. There are 2 sets of modules available for personal users and businesses. ',
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
                  child: const CyberSecurityCategory("Cybersecurity for Personal Users"),
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
                  child: const CyberSecurityCategory(
                      "Cybersecurity for Business Owners/Employees"),
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
