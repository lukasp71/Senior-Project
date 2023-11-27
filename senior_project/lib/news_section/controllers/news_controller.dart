import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:senior_project/news_section/constants/constants.dart'
    as Constants;
import 'package:senior_project/news_section/models/article_model.dart';
import 'package:senior_project/news_section/models/news_model.dart';

class NewsController extends GetxController {
  List<ArticleModel> allNews = <ArticleModel>[];
  List<ArticleModel> breakingNews = <ArticleModel>[];
  ScrollController scrollController = ScrollController();
  RxBool articleNotFound = false.obs;
  RxBool isLoading = false.obs;
  RxString cName = ''.obs;
  RxString country = ''.obs;
  RxString category = ''.obs;
  RxString channel = ''.obs;
  RxString searchNews = ''.obs;
  RxInt pageNum = 1.obs;
  RxInt pageSize = 10.obs;
  String baseUrl = "https://newsapi.org/v2/top-headlines?";

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getBreakingNews();
    super.onInit();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
      getBreakingNews();
    }
  }

  getBreakingNews() async {
    articleNotFound.value = false;

    if (isLoading.value == true) {
      pageNum++;
    } else {
      breakingNews = [];
      pageNum.value = 1;
    }

    baseUrl =
        "https://newsapi.org/v2/everything?q=cybersecurity&pageSize=100&page=$pageNum&";
    baseUrl += 'apiKey=${Constants.NewsApiConstants.newsApiKey}';

    getBreakingNewsFromApi(baseUrl);
  }

  getAllNews() async {
    articleNotFound.value = false;

    if (isLoading.value == true) {
      pageNum++;
    } else {
      allNews = [];
      pageNum.value = 1;
    }

    baseUrl =
        "https://newsapi.org/v2/everything?q=cybersecurity&pageSize=99&page=$pageNum&";
    baseUrl += 'apiKey=${Constants.NewsApiConstants.newsApiKey}';

    getAllNewsFromApi(baseUrl);
  }

  getBreakingNewsFromApi(url) async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));

      if (newsData.articles.isEmpty && newsData.totalResults == 0) {
        articleNotFound.value = isLoading.value == true ? false : true;
        isLoading.value = false;
        update();
      } else {
        if (isLoading.value == true) {
          breakingNews = [...breakingNews, ...newsData.articles];
          update();
        } else {
          if (newsData.articles.isNotEmpty) {
            breakingNews = newsData.articles;
            if (scrollController.hasClients) scrollController.jumpTo(0.0);
            update();
          }
        }
        articleNotFound.value = false;
        isLoading.value = false;
        update();
      }
    } else {
      articleNotFound.value = true;
      update();
    }
  }

  getAllNewsFromApi(url) async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));

      if (newsData.articles.isEmpty && newsData.totalResults == 0) {
        articleNotFound.value = isLoading.value == true ? false : true;
        isLoading.value = false;
        update();
      } else {
        if (isLoading.value == true) {
          allNews.addAll(newsData.articles); // Use addAll to append articles
          update();
        } else {
          if (newsData.articles.isNotEmpty) {
            allNews = newsData.articles;
            if (scrollController.hasClients) scrollController.jumpTo(0.0);
            update();
          }
        }
        articleNotFound.value = false;
        isLoading.value = false;
        update();
      }
    } else {
      articleNotFound.value = true;
      update();
    }
  }
}
