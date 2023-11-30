import 'package:flutter/material.dart';
import 'package:senior_project/education_section/business_modules/aiandiot_module/cyberai.dart';
import 'package:senior_project/education_section/business_modules/aiandiot_module/iOT.dart';
import 'package:senior_project/education_section/business_modules/cyberlaw_module/cyberlaw.dart';
import 'package:senior_project/education_section/business_modules/cyberlaw_module/ethicalhacking.dart';
import 'package:senior_project/education_section/business_modules/employeetraining.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/anonymous.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/firewall.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/intrusion.dart';
import 'package:senior_project/education_section/business_modules/firewall_module/vpn.dart';
import 'package:senior_project/education_section/business_modules/mobile_modules/persmissions.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';

void main() => runApp(MaterialApp(
      home: BusinessModulePage(),
    ));

class BusinessModulePage extends StatefulWidget {
  @override
  _BusinessModulePageState createState() => _BusinessModulePageState();
}

class _BusinessModulePageState extends State<BusinessModulePage> {
  String selectedSection = '';

  final Map<String, List<String>> modules = {
    'AI and IOT': [
      'AI in Cybersecurity',
      'IOT',
    ],
    'Cybersecurity Laws': [
      'Intro to Cyber Laws',
      'Ethical Hacking',
    ],
    'Firewalls': [
      'Anonymous Browsing',
      'Types of Firewalls',
      'Intrusion Prevention Software',
      'Virtual Private Networks'
    ],
    'Mobile Security': [
      'mobile permissions',
    ],
    'Employee Training': [
      'How to train employees',
    ]
  };

  final Map<String, Widget> sectionPages = {
    'AI in Cybersecurity': AIinCyber(),
    'IOT': IOT(),
    'Intro to Cyber Laws': LawPage(),
    'Ethical Hacking': EthicalHacking(),
    'Anonymous Browsing': AnonymousBrowsing(),
    'Types of Firewalls': FirewallPage(),
    'Intrusion Prevention Software': IntrusionPage(),
    'Virtual Private Networks': VPNPage(),
    'mobile permissions': AppPermissionPage(),
    'How to train employees': EmployeeTrainingPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppBar(currentSection: 'Education', backArrow: true),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ListView.separated(
              itemCount: modules.keys.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final moduleTitle = modules.keys.elementAt(index);
                return ExpansionTile(
                  title: Text(
                    moduleTitle,
                    style: TextStyle(fontSize: 30.0),
                  ),
                  children: modules[moduleTitle]!
                      .map((sectionTitle) => Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSection = sectionTitle;
                                });
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  sectionTitle,
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding: EdgeInsets.all(16.0),
            child: selectedSection.isNotEmpty
                ? sectionPages[selectedSection]!
                : Center(
                    child: Text(
                      'Select a section to view its content.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
