import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:senior_project/news_section/controllers/news_article.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var allNews = <NewsArticle>[].obs;
  var breakingNews = <NewsArticle>[].obs;
  var articleNotFound = false.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      var response = await http.get(
          'https://api.thenewsapi.com/v1/news?api_token=x3ryy5ubKOIbpmFAVgRKuKfTVajMuz700UuMZSCY'
              as Uri);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        allNews.value = jsonData['data']
            .map<NewsArticle>((json) => NewsArticle.fromJson(json))
            .toList();
        breakingNews.value = allNews
            .take(5)
            .toList(); // Assuming you want the first 5 articles as breaking news
      } else {
        articleNotFound.value = true;
      }
    } catch (error) {
      articleNotFound.value = true;
    }
    isLoading.value = false;
  }
}
