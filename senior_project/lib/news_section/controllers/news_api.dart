import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

class NewsAPI {
  static const String _apiKey = 'ee8499f0e2a249f2a58e02a35a679c90';
  static const String _baseUrl = 'https://newsapi.org/v2/';

  static Future<List<Article>> getLatestArticles() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['articles'];
      return jsonData.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
