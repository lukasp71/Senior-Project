import 'package:flutter/material.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/career_opportunity_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/def_importance_page.dart';
import 'package:senior_project/education_section/user_education_modules/intro_module/historical_content_page.dart';
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

class Modules {
  final String title;
  final List<String> subsections;

  Modules(this.title, this.subsections);
}

final List<Modules> modules = [
  Modules('Introduction to Cybersecurity', [
    'Definition and Importance',
    'Key Concepts',
    'Historical Context',
    'Career Opportunities'
  ]),
  Modules('Malware', [
    'Definition and Types',
    'How Malware Spreads',
    'The impact of Malware',
    'Prevention and Remidiation'
  ]),
  Modules('Threats and Attacks', [
    // ... other subsections
  ]),
  Modules('Network Security', [
    // ... other subsections
  ]),
  Modules('Encryption', [
    // ... other subsections
  ]),
  // ... other modules
];

final Map<String, Widget Function()> sectionPages = {
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

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  void navigateToSection(BuildContext context, String subsection) {
    final pageBuilder = sectionPages[subsection];
    if (pageBuilder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pageBuilder()),
      );
    } else {
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text('Modules'),
            decoration: BoxDecoration(
              color:  Color.fromARGB(255, 0, 94, 172),
            ),
          ),
          ...modules
              .map((module) => ExpansionTile(
                    title: Text(module.title),
                    children: module.subsections
                        .map((subsection) => ListTile(
                              title: Text(subsection),
                              onTap: () {
                                navigateToSection(context, subsection);
                              },
                            ))
                        .toList(),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
