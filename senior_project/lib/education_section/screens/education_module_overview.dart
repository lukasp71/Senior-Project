import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: ModulePage(),
    ));

class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final Map<String, List<String>> modules = {
    'Introduction to Cybersecurity': [
      'Definition and Importance',
      'History and Evolution of Cyber Threats',
      'Types of Cyber Threats',
    ],
    'Cyber Threats and Attacks': [
      'Phishing and Spear Phishing',
      'Man-in-the-Middle Attacks',
      'Distributed Denial of Service (DDoS) Attacks',
      'Drive-by Downloads',
      'Zero-day Exploits',
      'Cybersecurity Best Practices',
    ],
    'Malware': [
      'Two-factor Authentication (2FA)',
      'Regular Software Updates',
      'Safe Browsing Habits',
      'Avoiding Suspicious Emails and Attachments',
      'Secure Networking',
    ],
    'Social Engineering': [
      'Encryption (End-to-end Encryption, SSL/TLS)',
      'Cookies and Trackers',
      'Browsing Anonymously',
      'Mobile Security',
      'Secure Online Shopping',
      'Recognizing Secure Websites',
      'Protecting Financial Data',
      'Cybersecurity for Businesses',
    ],
    'Encryption': ['Insert subsections here']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybersecurity Modules'),
      ),
      body: ListView.separated(
        itemCount: modules.keys.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final module = modules.keys.elementAt(index);
          return ExpansionTile(
            title: Text(module),
            children: modules[module]!
                .map((section) => Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(section),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
