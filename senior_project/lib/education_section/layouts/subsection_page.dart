import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



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
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    content,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
      
    );
  }
}