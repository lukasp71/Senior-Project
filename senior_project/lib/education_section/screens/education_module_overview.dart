import 'package:flutter/material.dart';
import 'package:senior_project/education_section/education_modules/encryption_module.dart';
import 'package:senior_project/education_section/education_modules/intro_module.dart';
import 'package:senior_project/education_section/education_modules/malware.dart';
import 'package:senior_project/education_section/education_modules/network_security.dart';
import 'package:senior_project/education_section/education_modules/threats_attacks_module.dart';

class ModuleOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybersecurity Modules'),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Basic Concepts of Cybersecurity'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroToCybersecurity()),
              ),
            ),
            ListTile(
              title: Text('Threats and Attacks'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TypesOfThreatsAndAttacks()),
              ),
            ),
            ListTile(
              title: Text('Network Security'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NetworkSecurity()),
              ),
            ),
            ListTile(
              title: Text('Malware'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Malware()),
              ),
            ),
            ListTile(
              title: Text('Encryption'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Encryption()),
              ),
            ),
          ],
        ).toList(),
      ),
    );
  }
}
