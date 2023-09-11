// The implementation of this section is based on a Flutter Tutorial from medium.com
// Base code for implementation comes from https://nabendu82.medium.com/flutter-news-app-using-newsapi-2294c2dcf673.


import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cybersecurity News and Education App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white
      ),
    );
  }
}