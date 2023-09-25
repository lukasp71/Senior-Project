import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<Home> {
  List<dynamic> articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final url =
        'https://api.thenewsapi.com/v1/news/all?api_token=x3ryy5ubKOIbpmFAVgRKuKfTVajMuz700UuMZSCY&search=forex + (usd | gbp) -cad&language=en&categories=business,tech&exclude_categories=travel&published_after=2023-09-18';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          articles = jsonData['data'];
        });
      } else {
        print('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(articles[index]['title'] ?? 'No Title'),
            subtitle: Text(articles[index]['description'] ?? 'No Description'),
            onTap: () {
              _launchURL(articles[index]['url']);
              // Handle tapping on a news article
              // You can navigate to a detailed view or launch a URL, etc.
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
