import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/career_opportunity_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/def_importance_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/historical_content_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/intro_module_start.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/key_concepts_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/intro_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/malware_impact_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/malware_spread_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/prevention_remidiation_page.dart';
import 'package:senior_project/education_section/user_education_modules/malware_module/types_definition_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/attack_methodology_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/common_threats_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/incident_response_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/intro_page.dart';
import 'package:senior_project/education_section/user_education_modules/threats_attacks_module/prevention_methods_page.dart';
import 'package:senior_project/education_section/user_education_quizzes/intro_module_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/malware_module_quiz.dart';
import 'package:senior_project/education_section/user_education_quizzes/threat_attack_module_quiz.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';

void main() => runApp(MaterialApp(
      home: ModulePage(),
      debugShowCheckedModeBanner: false,
    ));

class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final Map<String, List<String>> modules = {
    'Chapter 1: Introduction to Cybersecurity': [
      'Section 1.1: Intro to Cybersecurity',
      'Section 1.2: Definition and Importance',
      'Section 1.3: Key Concepts',
      'Section 1.4: History and Evolution of Cyber Threats',
      'Section 1.5: Career Opportunities',
      'Quiz 1',
    ],
    'Chapter 2: Cyber Threats and Attacks': [
      'Section 2.1: Intro to Threats and Attacks',
      'Section 2.2: Common Threats',
      'Section 2.3: Attack Methodology',
      'Section 2.4: Incident Response',
      'Section 2.5: Prevention Methods',
      'Quiz 2',
    ],
    'Chapter 3: Malware': [
      'Section 3.1: Intro to Malware',
      'Section 3.2: Types of Malware',
      'Section 3.3: How Malware Spreads',
      'Section 3.4: The Impact of Malware',
      'Section 3.5: Prevention and Remediation',
      'Quiz 3',
    ],
    'Chapter 4: Social Engineering': [],
    'Encryption': ['Insert subsections here']
  };

  final Map<String, Widget Function()> sectionPages = {
    'Section 1.1: Intro to Cybersecurity': () => IntroToCybersecurityPage(),
    'Section 1.2: Definition and Importance': () =>
        DefinitionAndImportancePage(),
    'Section 1.3: Key Concepts': () => KeyConceptsPage(),
    'Section 1.4: History and Evolution of Cyber Threats': () =>
        HistoricalContextPage(),
    'Section 1.5: Career Opportunities': () => CareersInCybersecurityPage(),
    'Section 2.1: Intro to Threats and Attacks': () =>
        IntroToThreatsAndAttacksPage(),
    'Section 2.2: Common Threats': () => CommonCyberThreatsPage(),
    'Section 2.3: Attack Methodology': () => AttackMethodologyPage(),
    'Section 2.4: Incident Response': () => IncidentResponseRecoveryPage(),
    'Section 2.5: Prevention Methods': () => PreventionMeasuresPage(),
    'Section 3.1: Intro to Malware': () => MalwareIntroPage(),
    'Section 3.2: Types of Malware': () => DefinitionAndTypesOfMalwarePage(),
    'Section 3.3: How Malware Spreads': () => HowMalwareSpreadsPage(),
    'Section 3.4: The Impact of Malware': () => ImpactOfMalwarePage(),
    'Section 3.5: Prevention and Remediation': () =>
        PreventionAndRemediationPage(),
    'Quiz 1': () => IntroQuizPage(),
    'Quiz 2': () => MalwareQuizPage(),
    'Quiz 3': () => ThreatAttackQuizPage()
  };

  void navigateToSection(String sectionTitle) {
    final pageBuilder = sectionPages[sectionTitle];
    if (pageBuilder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pageBuilder(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppBar(currentSection: 'Education'),
      body: ListView.separated(
        itemCount: modules.keys.length,
        separatorBuilder: (context, index) =>
            const Divider(thickness: 20, height: 30),
        itemBuilder: (context, index) {
          final moduleTitle = modules.keys.elementAt(index);
          return ExpansionTile(
            title: Text(
              moduleTitle,
              style: TextStyle(fontSize: 30.0),
            ),
            children: modules[moduleTitle]!
                .map((sectionTitle) => Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: ElevatedButton(
                        onPressed: () => navigateToSection(sectionTitle),
                        child: Align(
                          alignment: Alignment.center,
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
    );
  }
}

class SectionPage extends StatelessWidget {
  final String moduleTitle;
  final String sectionTitle;

  SectionPage(this.moduleTitle, this.sectionTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$moduleTitle: $sectionTitle'),
      ),
      body: Center(
        child: Text('Content for $sectionTitle'),
      ),
    );
  }
}
