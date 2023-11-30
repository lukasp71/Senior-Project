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
    'Chapter 1: AI and IOT': [
      'Section 1.1: AI in Cybersecurity',
      'Section 1.2: IOT',
    ],
    'Chapter 2: Cybersecurity Laws': [
      'Section 2.1: Intro to Cyber Laws',
      'Section 2.2: Ethical Hacking',
    ],
    'Chapter 3: Firewalls': [
      'Section 3.1: Anonymous Browsing',
      'Section 3.2: Types of Firewalls',
      'Section 3.3: Intrusion Prevention Software',
      'Section 3.4: Virtual Private Networks'
    ],
    'Chapter 4: Mobile Security': [
      'Section 4.1: Mobile Permissions',
    ],
    'Chapter 5: Employee Training': [
      'Section 5.1: How To Train Employees',
    ]
  };

  final Map<String, Widget> sectionPages = {
    'Section 1.1: AI in Cybersecurity': AIinCyber(),
    'Section 1.2: IOT': IOT(),
    'Section 2.1: Intro to Cyber Laws': LawPage(),
    'Section 2.2: Ethical Hacking': EthicalHacking(),
    'Section 3.1: Anonymous Browsing': AnonymousBrowsing(),
    'Section 3.2: Types of Firewalls': FirewallPage(),
    'Section 3.3: Intrusion Prevention Software': IntrusionPage(),
    'Section 3.4: Virtual Private Networks': VPNPage(),
    'Section 4.1: Mobile Permissions': AppPermissionPage(),
    'Section 5.1: How To Train Employees': EmployeeTrainingPage(),
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
