import "package:flutter/material.dart";
import "package:senior_project/services/auth.dart";

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: const Text('Sign in'),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
                  widget.toggleView;
                },
                icon: const Icon(Icons.person),
                label: const Text('Register'))
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
              child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: Text('Sign in', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          )),
        ));
  }
}
