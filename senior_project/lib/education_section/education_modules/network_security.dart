import 'package:flutter/material.dart';

class NetworkSecurity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Security'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction to Network Security',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Network security is the practice of preventing unauthorized access, '
              'use, disclosure, disruption, modification, or destruction of information. '
              'This is usually achieved by implementing measures to monitor and control '
              'data traffic on a network.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            // Example image
            Image.asset('assets/images/network_security.png'),
          ],
        ),
      ),
    );
  }
}
