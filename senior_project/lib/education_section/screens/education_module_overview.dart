import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/encryption_module/encryption_algorithms_page.dart';
import 'package:senior_project/education_section/user_education_modules/encryption_module/encryption_future_page.dart';
import 'package:senior_project/education_section/user_education_modules/encryption_module/encryption_in_practice_page.dart';
import 'package:senior_project/education_section/user_education_modules/encryption_module/intro_encryption_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/career_opportunity_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/def_importance_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/historical_content_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/key_concepts_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/malware_impact_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/malware_spread_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/prevention_remidiation_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/types_definition_page.dart';
import 'package:senior_project/education_section/user_education_modules/social_engineering_module/case_study_page.dart';
import 'package:senior_project/education_section/user_education_modules/social_engineering_module/intro_page.dart';
import 'package:senior_project/education_section/user_education_modules/social_engineering_module/legal_ethical_page.dart';
import 'package:senior_project/education_section/user_education_modules/social_engineering_module/prevention_strategies_page.dart';
import 'package:senior_project/education_section/user_education_modules/social_engineering_module/tehcniques_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/attack_methodology_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/common_threats_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/incident_response_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/prevention_methods_page.dart';
import 'package:senior_project/education_section/user_education_quizzes/encryption_module_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/intro_module_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/malware_module_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/social_engineering_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/threat_attack_module_quiz.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';

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
    'Chapter 4: Social Engineering': [
      'Section 4.1: Intro to Social Engineering',
      'Section 4.2: Social Engineering Techniques',
      'Section 4.3: Case Studies of Social Engineering',
      'Section 4.4: Prevention Strategies',
      'Section 4.5: Legal and Ethical Implications',
      'Quiz 4'
    ],
    'Chapter 5: Encryption': [
      'Section 5.1: Intro to Encrpytion',
      'Section: 5.2: Encryption Algorithms',
      'Section 5.3: Encryption in Practice',
      'Section 5.4: Future of Encryption',
      'Quiz 5'
    ]
  };

  final Map<String, Widget> sectionPages = {
    'Section 1.1: Definition and Importance': DefinitionAndImportancePage(),
    'Section 1.2: Key Concepts': KeyConceptsPage(),
    'Section 1.3: History and Evolution of Cyber Threats':
        HistoricalContextPage(),
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
    'Quiz 3': ThreatAttackQuizPage(),
    'Section 4.1: Intro to Social Engineering': IntroToSocialEngineering(),
    'Section 4.2: Social Engineering Techniques':
        SocialEngineeringTechniquesPage(),
    'Section 4.3: Case Studies of Social Engineering': CaseStudiesPage(),
    'Section 4.4: Prevention Strategies': PreventionStrategiesPage(),
    'Section 4.5: Legal and Ethical Implications':
        LegalEthicalConsiderationsPage(),
    'Quiz 4': SocialEngineeringQuizPage(),
    'Section 5.1: Intro to Encrpytion': EncryptionFundamentalsPage(),
    'Section: 5.2: Encryption Algorithms': EncryptionTypesPage(),
    'Section 5.3: Encryption in Practice': EncryptionPracticePage(),
    'Section 5.4: Future of Encryption': EncryptionChallengesFuturePage(),
    'Quiz 5': EncryptionQuizPage(),
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
