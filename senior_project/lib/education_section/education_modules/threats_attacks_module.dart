import 'package:flutter/material.dart';

class TypesOfThreatsAndAttacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Threats and Attacks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common Threats in Cybersecurity',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '1. Malware: Software that is specifically designed to disrupt, damage, '
              'or gain unauthorized access to a computer system.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              '2. Phishing: Cybercrime where targets are contacted by email, telephone, '
              'or text message by someone posing as a legitimate institution.',
              style: TextStyle(fontSize: 18),
            ),
            // ... You can continue listing other threats
          ],
        ),
      ),
    );
  }
}
