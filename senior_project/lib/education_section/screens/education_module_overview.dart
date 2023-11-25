import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/career_opportunity_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/def_importance_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/historical_content_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/key_concepts_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/malware_impact_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/malware_spread_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/prevention_remidiation_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/types_definition_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/attack_methodology_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/common_threats_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/incident_response_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/prevention_methods_page.dart';
import 'package:senior_project/education_section/user_education_quizzes/intro_module_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/malware_module_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/threat_attack_module_quiz.dart';

void main() => runApp(MaterialApp(
      home: ModulePage(),
    ));

class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  String selectedSection = '';

  final Map<String, List<String>> modules = {
    'Chapter 1: Introduction to Cybersecurity': [
      'Section 1.1: Definition and Importance',
      'Section 1.2: Key Concepts',
      'Section 1.3: History and Evolution of Cyber Threats',
      'Section 1.4: Career Opportunities',
      'Quiz 1',
    ],
    'Chapter 2: Cyber Threats and Attacks': [
      'Section 2.1: Common Threats',
      'Section 2.2: Attack Methodology',
      'Section 2.3: Incident Response',
      'Section 2.4: Prevention Methods',
      'Quiz 2',
    ],
    'Chapter 3: Malware': [
      'Section 3.1: Types of Malware',
      'Section 3.2: How Malware Spreads',
      'Section 3.3: The Impact of Malware',
      'Section 3.4: Prevention and Remediation',
      'Quiz 3',
    ],
    'Chapter 4: Social Engineering': [],
    'Encryption': ['Insert subsections here']
  };

  final Map<String, Widget> sectionPages = {
    'Section 1.1: Definition and Importance': DefinitionAndImportancePage(),
    'Section 1.2: Key Concepts': KeyConceptsPage(),
    'Section 1.3: History and Evolution of Cyber Threats': HistoricalContextPage(),
    'Section 1.4: Career Opportunities': CareersInCybersecurityPage(),
    'Section 2.1: Common Threats': CommonCyberThreatsPage(),
    'Section 2.2: Attack Methodology': AttackMethodologyPage(),
    'Section 2.3: Incident Response': IncidentResponseRecoveryPage(),
    'Section 2.4: Prevention Methods': PreventionMeasuresPage(),
    'Section 3.1: Types of Malware': DefinitionAndTypesOfMalwarePage(),
    'Section 3.2: How Malware Spreads': HowMalwareSpreadsPage(),
    'Section 3.3: The Impact of Malware': ImpactOfMalwarePage(),
    'Section 3.4: Prevention and Remediation': PreventionAndRemediationPage(),
    'Quiz 1': IntroQuizPage(),
    'Quiz 2': MalwareQuizPage(),
    'Quiz 3': ThreatAttackQuizPage()
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Cybersecurity Learning Modules for Businesses and Employees',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 0, 94, 172),
      ),
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
