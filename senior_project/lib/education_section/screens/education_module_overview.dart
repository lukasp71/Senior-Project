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
      'Intro to Cybersecurity',
      'Definition and Importance',
      'Key Concepts',
      'History and Evolution of Cyber Threats',
      'Career Opportunities',
    ],
    'Cyber Threats and Attacks': [
      'Intro to Threats and Attacks',
      'Common Threats',
      'Attack Methodology',
      'Incident Response',
      'Prevention Methods'
    ],
    'Malware': [
      'Intro to Malware',
      'Types of Malware',
      'How Malware Spreads',
      'The Impact of Malware',
      'Prevention and Remidiation'
    ],
    'Social Engineering': [],
    'Encryption': ['Insert subsections here']
  };

  final Map<String, Widget Function()> sectionPages = {
    'Intro to Cybersecurity': () => IntroToCybersecurityPage(),
    'Definition and Importance': () => DefinitionAndImportancePage(),
    'Key Concepts': () => KeyConceptsPage(),
    'History and Evolution of Cyber Threats': () => HistoricalContextPage(),
    'Career Opportunities': () => CareersInCybersecurityPage(),
    'Intro to Threats and Attacks': () => IntroToThreatsAndAttacksPage(),
    'Common Threats': () => CommonCyberThreatsPage(),
    'Attack Methodology': () => AttackMethodologyPage(),
    'Incident Response': () => IncidentResponseRecoveryPage(),
    'Prevention Methods': () => PreventionMeasuresPage(),
    'Intro to Malware': () => MalwareIntroPage(),
    'Types of Malware': () => DefinitionAndTypesOfMalwarePage(),
    'How Malware Spreads': () => HowMalwareSpreadsPage(),
    'The Impact of Malware': () => ImpactOfMalwarePage(),
    'Prevention and Remidiation': () => PreventionAndRemediationPage(),
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
      appBar: AppBar(
        title: Text('Cybersecurity Modules'),
      ),
      body: ListView.separated(
        itemCount: modules.keys.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final moduleTitle = modules.keys.elementAt(index);
          return ExpansionTile(
            title: Text(moduleTitle),
            children: modules[moduleTitle]!
                .map((sectionTitle) => Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: ElevatedButton(
                        onPressed: () => navigateToSection(sectionTitle),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(sectionTitle),
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
