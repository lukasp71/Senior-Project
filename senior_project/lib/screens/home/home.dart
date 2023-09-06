import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:senior_project/screens/home/user_data.dart';
import 'package:senior_project/services/auth.dart';
import 'package:senior_project/services/databse.dart';
import 'package:provider/provider.dart';
import '../../models/userinfo.dart';

final AuthService _auth = AuthService();

class Home extends StatefulWidget {
  const Home({super.key});
   
@override
_HomeScreenState createState() => _HomeScreenState();

}
class _HomeScreenState extends State <Home> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<UserInformation>?>.value(
      value: DatabaseService(uid: "").userData,
      initialData: null,
      child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.person),
                onPressed: () async {
                  await _auth.signOut();
                },
                label: Text('logout'),
              )
            ],
          ),
          body: UserData()),
    );
  }
}