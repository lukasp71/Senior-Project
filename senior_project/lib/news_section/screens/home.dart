import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic selectedArticle; // Article to display

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final apiKey =
        'ee8499f0e2a249f2a58e02a35a679c90'; // Replace with your News API key
    final url = 'https://newsapi.org/v2/everything?q=cyber&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          selectedArticle =
              jsonData['articles'][0]; // Display the first article
        });
      } else {
        print('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyber News'),
        centerTitle: true,
        actions: [
          Center(
            child: DropdownButton(
              onChanged: (value) {
                // Handle dropdown menu item selection here
              },
              items: [
                DropdownMenuItem(
                  value: 'vulnerabilities',
                  child: Text('Vulnerabilities'),
                ),
                DropdownMenuItem(
                  value: 'education',
                  child: Text('Education'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: selectedArticle != null
            ? buildArticle(selectedArticle)
            : CircularProgressIndicator(),
      ),
    );
  }

  Widget buildArticle(dynamic article) {
    return InkWell(
      onTap: () {
        _launchURL(article['url']);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (article['urlToImage'] != null)
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      article['urlToImage'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['title'] ?? 'No Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    article['description'] ?? 'No Description',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Source: ${article['source']['name']}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Published: ${article['publishedAt']}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Home()));
}
