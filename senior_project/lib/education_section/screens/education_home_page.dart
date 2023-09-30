import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NICCSPage(),
    );
  }
}

class NICCSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Threat Detection Hub',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text('About NICCS')),
          TextButton(
              onPressed: () {}, child: Text('Become a Training Provider')),
          TextButton(
              onPressed: () {}, child: Text('Cybersecurity News & Events')),
          IconButton(icon: Icon(Icons.mail), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/flashNews.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text('LEARN MORE ABOUT THE NICE FRAMEWORK')),
                  TextButton(
                      onPressed: () {},
                      child:
                          Text('FIND 12,000+ CYBERSECURITY TRAINING COURSES')),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                          'PLAN YOUR NEXT CAREER MOVE USING THE CYBER CAREER PATHWAYS TOOL')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
