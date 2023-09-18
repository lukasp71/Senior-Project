import 'dart:js_interop';
import 'package:firebase_core/firebase_core.dart';
import 'package:senior_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/screens/authenticate/sign_in.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Project',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cybersecurity News and Education Application V2023'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/cyberimage.jpg'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                     MaterialPageRoute(
                        builder: (context) => SignIn(),
                        )
                      );
              
                    },
                    child: const Text('Login With Current Account'),
                  ),
                  const SizedBox(height: 30), 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        )
                      );
                    },
                    child: const Text('Register a New Account'),
                  ),
                   const SizedBox(height: 30), 
                  ElevatedButton(
                    onPressed: () {
                    
                    },
                    child: const Text('Login as a Guest'),
                  ),
                ],
              ),
            ),
             const Positioned(
              top: 190, // Adjust the top value to move the text higher
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Welcome to the Threat Awareness Hub.'
                ,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              )
             ),
             const Positioned(
              top: 220, // Adjust the top value to move the text higher
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'This is a new application designed to help everyone learn and improve their cybersecurity knowledge.'
                ,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              )
             ),
             const Positioned(
              top: 250, // Adjust the top value to move the text higher
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'You can also stay up to date with the latest cybersecurity events going on.'
                ,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              )
             ),
          ],
        ),
      ),
    );
  }
}