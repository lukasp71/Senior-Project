import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/main.dart';



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
          style: GoogleFonts.poppins(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 94, 172),
  
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'returnToMain') {
                // Use Navigator to pop back to the main page (MainPage)
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                  (Route<dynamic> route) => false,
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'returnToMain',
                  child: Text('Home Page'),
                ),
                // Add more menu items as needed
              ];
            },
          ),
        ],
      ),
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
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onBackward,
                iconSize: 30.0,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: onForward,
                iconSize: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}