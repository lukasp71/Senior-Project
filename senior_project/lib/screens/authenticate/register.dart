import 'package:flutter/material.dart';
import 'package:senior_project/services/auth.dart';
import 'package:senior_project/shared/constants.dart';
import '../../shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor:
                Colors.white, // Use your preferred background color
            body: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            validator: (val) => val!.length < 6
                                ? 'Password must be at least 6 characters long'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors
                                  .blue, // Use your preferred button color
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color:
                                  Colors.blue, // Use your preferred link color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
