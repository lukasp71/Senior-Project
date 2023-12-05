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
import 'package:senior_project/education_section/user_education_quizzes/Firewallquiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/aiandiotquiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/cyberlawquiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/employeetrainingquiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/ethicalhackingquiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/mobilequiz.dart';
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
      'AI and IOT Quiz'
    ],
    'Chapter 2: Cybersecurity Laws': [
      'Section 2.1: Intro to Cyber Laws',
      'Section 2.2: Ethical Hacking',
      'Cyber Law Quiz',
      'Ethical Hacking Quiz'
    ],
    'Chapter 3: Firewalls': [
      'Section 3.1: Anonymous Browsing',
      'Section 3.2: Types of Firewalls',
      'Section 3.3: Intrusion Prevention Software',
      'Section 3.4: Virtual Private Networks',
      'Firewalls Quiz'
    ],
    'Chapter 4: Mobile Security': [
      'Section 4.1: Mobile Permissions',
      'Mobile Security Quiz'
    ],
    'Chapter 5: Employee Training': [
      'Section 5.1: How To Train Employees',
      'Employee Training Quiz'
    ]
  };

  final Map<String, Widget> sectionPages = {
    'Section 1.1: AI in Cybersecurity': const AIinCyber(),
    'Section 1.2: IOT': const IOT(),
    'Section 2.1: Intro to Cyber Laws': const LawPage(),
    'Section 2.2: Ethical Hacking': const EthicalHacking(),
    'Section 3.1: Anonymous Browsing': const AnonymousBrowsing(),
    'Section 3.2: Types of Firewalls': const FirewallPage(),
    'Section 3.3: Intrusion Prevention Software': const IntrusionPage(),
    'Section 3.4: Virtual Private Networks': const VPNPage(),
    'Section 4.1: Mobile Permissions': const AppPermissionPage(),
    'Section 5.1: How To Train Employees': const EmployeeTrainingPage(),
    'AI and IOT Quiz': AIandIoTQuizPage(),
    'Cyber Law Quiz': CyberLawQuizPage(),
    'Ethical Hacking Quiz': EthicalHackingQuizPage(),
    'Firewalls Quiz': FirewallQuizPage(),
    'Mobile Security Quiz': MobileQuizPage(),
    'Employee Training Quiz': EmployeeTrainingQuiz()
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
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final moduleTitle = modules.keys.elementAt(index);
                return ExpansionTile(
                  title: Text(
                    moduleTitle,
                    style: const TextStyle(fontSize: 30.0),
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
                                  style: const TextStyle(fontSize: 30.0),
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
            padding: const EdgeInsets.all(16.0),
            child: selectedSection.isNotEmpty
                ? sectionPages[selectedSection]!
                : const Center(
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
