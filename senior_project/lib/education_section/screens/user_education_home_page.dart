import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: EducationHomePage()));

class EducationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Education Section')),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Show the sidebar popup to switch to news mode
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/flashNews.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              // WebView Widget
              Container(
                height: 150,
                /*child: WebView(
                  initialUrl: 'https://example.com',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
                */
              ),
              SizedBox(height: 20),
              Text(
                'Education',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Cards
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // 80% width
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20), // Thicker padding
                      title: Text('Module Overview'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to the module page
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // 80% width
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20), // Thicker padding
                      title: Text('User Interaction Page'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to the user interaction page
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
