import "package:flutter/material.dart";

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Theme.of(context).backgroundColor, // Use the app's background color
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor, // Use the app's primary color
          ),
          strokeWidth: 4.0, // Adjust the thickness of the progress indicator
        ),
      ),
    );
  }
}
