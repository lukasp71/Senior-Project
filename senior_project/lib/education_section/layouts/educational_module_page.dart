import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/educational_module_sidebar.dart';

class ModuleIntroPage extends StatelessWidget {
  final String moduleTitle;
  final String introText;
  final VoidCallback onStart;

  ModuleIntroPage({
    required this.moduleTitle,
    required this.introText,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(moduleTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Introduction',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 16.0),
            Text(introText),
            // ... any other content, such as images
            Spacer(),
            ElevatedButton(
              onPressed: onStart,
              child: Text('Start'),
            ),
          ],
        ),
      ),
      drawer: SidebarMenu(
          // ... your sidebar menu code here, or import the SidebarMenu widget
          ),
    );
  }
}
