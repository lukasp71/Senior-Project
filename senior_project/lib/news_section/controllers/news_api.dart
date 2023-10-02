import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

class NewsAPI {
  static const String _apiKey = 'YOUR_API_KEY';
  static const String _baseUrl = 'https://www.thenewsapi.com/api/';

  static Future<List<Article>> getLatestArticles() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/news?api_token=$_apiKey'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
