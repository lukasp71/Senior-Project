import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/Module.dart';
import 'package:senior_project/education_section/layouts/educational_module_sidebar.dart';

class SubsectionPage extends StatelessWidget {
  final String subsectionTitle;
  final String content;
  final Module module;
  final int subsectionIndex;

  SubsectionPage(
      this.subsectionTitle, this.content, this.module, this.subsectionIndex);
//test2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subsectionTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(content),
            // ... other UI elements for the subsection page
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: subsectionIndex > 0
                  ? () {
                      // Navigate to the previous subsection page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubsectionPage(
                            module.subsections[subsectionIndex - 1],
                            'Content for ' +
                                module.subsections[subsectionIndex - 1],
                            module,
                            subsectionIndex - 1,
                          ),
                        ),
                      );
                    }
                  : null, // Disable the button if it's the first subsection
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: subsectionIndex < module.subsections.length - 1
                  ? () {
                      // Navigate to the next subsection page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubsectionPage(
                            module.subsections[subsectionIndex + 1],
                            'Content for ' +
                                module.subsections[subsectionIndex + 1],
                            module,
                            subsectionIndex + 1,
                          ),
                        ),
                      );
                    }
                  : null, // Disable the button if it's the last subsection
            ),
          ],
        ),
      ),
      drawer: SidebarMenu(),
    );
  }
}
