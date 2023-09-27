import 'package:flutter/material.dart';

void main() => runApp(EducationPage());

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cybersecurity Education'),
        ),
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Welcome to Cybersecurity Education',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Explore a wide range of cybersecurity topics and enhance your knowledge in this ever-evolving field.',
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
          SizedBox(height: 32.0),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          CategoryCard(
            title: 'Introduction to Cybersecurity',
            description:
                'Foundational concepts and principles of cybersecurity.',
          ),
          SizedBox(height: 16.0),
          CategoryCard(
            title: 'Network Security',
            description:
                'Learn about securing computer networks and data transmission.',
          ),
          SizedBox(height: 16.0),
          CategoryCard(
            title: 'Application Security',
            description:
                'Understanding security measures for applications and software.',
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String description;

  CategoryCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
