class NewsArticle {
  final String title;
  final String url;
  final String urlToImage;

  NewsArticle(
      {required this.title, required this.url, required this.urlToImage});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      url: json['url'],
      urlToImage: json['image_url'],
    );
  }
}
