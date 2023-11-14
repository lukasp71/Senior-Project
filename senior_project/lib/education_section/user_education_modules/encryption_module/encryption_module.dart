import 'package:flutter/material.dart';

class Encryption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basics of Encryption',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Encryption is the method by which information is converted into a secret code '
              'that hides the information\'s true meaning. The main purpose of encryption '
              'is to protect the confidentiality of digital data during transmission or while stored.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            // Example image
            Image.asset('assets/images/encryption.png'),
          ],
        ),
      ),
    );
  }
}
