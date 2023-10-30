import 'package:flutter/material.dart';
import 'package:senior_project/education_section/layouts/educational_module_sidebar.dart';

class SubsectionPage extends StatelessWidget {
  final String subsectionTitle;
  final String content;
  final VoidCallback onForward;
  final VoidCallback onBackward;

  SubsectionPage({
    required this.subsectionTitle,
    required this.content,
    required this.onForward,
    required this.onBackward,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subsectionTitle),
      ),
      body: SingleChildScrollView(
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
              onPressed: onBackward,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: onForward,
            ),
          ],
        ),
      ),
      drawer: SidebarMenu(),
    );
  }
}
