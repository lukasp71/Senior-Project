import 'package:flutter/material.dart';
import 'package:senior_project/database/screens/wrapper.dart';

class WelcomePopup extends StatefulWidget {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => WelcomePopup(),
    );
  }

  @override
  _WelcomePopupState createState() => _WelcomePopupState();
}

class _WelcomePopupState extends State<WelcomePopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Text('Welcome to Threat Awareness Hub'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Your one-stop for Cybersecurity News and Education. Take a look at the most recent cybersecurity news and vulnerabilities, as well as learn the basics of various cybersecurity concepts for you or your business.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Sign In'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Wrapper()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
