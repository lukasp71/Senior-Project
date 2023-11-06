import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          subsectionTitle,
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              content,
              style: GoogleFonts.montserrat(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
                height: 20.0), // Add spacing between text and the next widget
            SizedBox(
                height: 20.0), // Add spacing between button and the next widget
            // ... other UI elements for the subsection page
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: onBackward,
                iconSize: 30.0,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: onForward,
                iconSize: 30.0,
              ),
            ],
          ),
        ),
      ),
      drawer: SidebarMenu(),
    );
  }
}
