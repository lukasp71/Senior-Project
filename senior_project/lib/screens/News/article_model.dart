// The implementation of this section is based on a Flutter Tutorial from medium.com
// Base code for implementation comes from https://nabendu82.medium.com/flutter-news-app-using-newsapi-2294c2dcf673.

import 'source_model.dart';
class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});
factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}