import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Interested about Learning More on CyberSecurity and keeping yourself safe? We have a set of modules ready for you to learn and study.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Pick the Category that best fits you and/or your clients:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CyberSecurityCategory("Cybersecurity for You and Business"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModulePage()),
                );
              },
              child: SizedBox(
                height: 20,
                child: CyberSecurityCategory(
                    "Cybersecurity for the Tech Savvy Users"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CyberSecurityCategory extends StatelessWidget {
  final String title;

  CyberSecurityCategory(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Text(title),
    );
  }
}
