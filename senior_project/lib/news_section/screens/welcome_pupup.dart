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
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
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
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text(
            'Welcome to Threat Awareness Hub',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Your one-stop for Cybersecurity News and Education. Take a look at the most recent cybersecurity news and vulnerabilities, as well as learn the basics of various cybersecurity concepts for you or your business.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Register an account or sign into an already existing profile.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Sign In'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Wrapper()));
                  },
                ),
              ],
            ),
          ),
          titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          actionsAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
