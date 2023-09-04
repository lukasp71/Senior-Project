import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:senior_project/services/auth.dart';
final AuthService _auth = AuthService();

class Home extends StatefulWidget {
  const Home({super.key});
   
@override
_HomeScreenState createState() => _HomeScreenState();

 
}
class _HomeScreenState extends State <Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
       body: Stack(children: [
          TextButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('logout'),
          ),
           Positioned(
              top: 0,
              left: 30,
              child: Text('Hello',
                style: TextStyle(
                  color: Colors.black12,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                )
              )
           )
       ]
       )
    );
  }
}