import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/subsection_page.dart';

class ModuleIntroPage extends StatelessWidget {
  final Module module;

  ModuleIntroPage(this.module);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
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
            Text(module.introText),
            // ... any other content, such as images
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to the first subsection page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubsectionPage(
                      module.subsections[0], // Title of the first subsection
                      'Content for ' +
                          module.subsections[
                              0], // Content for the first subsection
                      module, // The current module
                      0, // The index of the first subsection
                    ),
                  ),
                );
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
          // ... your sidebar menu code here, or import the SidebarMenu widget
          ),
    );
  }
}
