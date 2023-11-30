import 'package:senior_project/news_section/models/source_model.dart';

class ArticleModel {
  ArticleModel(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.isFavorite, // New field
  );

  String? author, description, urlToImage, content;
  String title, url, publishedAt;
  SourceModel source;
  bool isFavorite; // New field

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'urlToImage': urlToImage,
      'content': content,
      'title': title,
      'url': url,
      'publishedAt': publishedAt,
      'source': source.toJson(),
      'isFavorite': isFavorite, // Include isFavorite in the JSON
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        SourceModel.fromJson(json['source'] as Map<String, dynamic>),
        json['author'],
        json['title'],
        json['description'],
        json['url'],
        json['urlToImage'],
        json['publishedAt'],
        json['content'],
        json['isFavorite'] ??
            false, // Set isFavorite from JSON (default to false)
      );

  // Helper method to create a new article with the favorite status toggled
  ArticleModel toggleFavorite() {
    return ArticleModel(
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
      !isFavorite,
    );
  }
}
