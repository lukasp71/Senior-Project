import 'package:flutter/material.dart';

class IntroToCybersecurity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction to Cybersecurity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is Cybersecurity?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Cybersecurity is the practice of protecting systems, networks, '
              'and programs from digital attacks. These cyberattacks are usually '
              'aimed at accessing, changing, or destroying sensitive information; '
              'extorting money from users; or interrupting normal business processes.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Image.asset(
                'assets/images/cybersecurity_intro.png'), // Example image
            SizedBox(height: 24),
            Text(
              'Importance of Cybersecurity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'With the increasing number and sophistication of cyberattacks, '
              'it has become essential to ensure robust cybersecurity.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
