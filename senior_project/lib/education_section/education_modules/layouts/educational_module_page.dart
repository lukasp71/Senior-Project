import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/education_modules/layouts/educational_module_page.dart';
import 'package:senior_project/education_section/layouts/educational_module_page.dart';

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

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybersecurity Education App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Modules'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ...modules
                .map((module) => ExpansionTile(
                      title: Text(module.title),
                      children: module.subsections
                          .map((subsection) => ListTile(
                                title: Text(subsection),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ModuleIntroPage(module as Module),
                                    ),
                                  );
                                },
                              ))
                          .toList(),
                    ))
                .toList(),
          ],
        ),
      ),
      body: Center(
        child: Text('Select a module from the sidebar'),
      ),
    );
  }
}