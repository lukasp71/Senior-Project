import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:senior_project/news_section/constants/constants.dart';
import 'package:senior_project/news_section/models/article_model.dart';
import 'package:senior_project/news_section/models/news_model.dart';

class NewsController extends GetxController {
  // for list view
  List<ArticleModel> allNews = <ArticleModel>[];
  // for carousel
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
  String baseUrl = "http://api.mediastack.com/v1";

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getAllNews();
    getBreakingNews();
    super.onInit();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
      getAllNews();
    }
  }

  // function to load and display breaking news on to UI
  getBreakingNews({reload = false}) async {
    articleNotFound.value = false;

    if (!reload && isLoading.value == false) {
    } else {
      country.value = '';
    }
    if (isLoading.value == true) {
      pageNum++;
    } else {
      breakingNews = [];

      pageNum.value = 2;
    }
    // default language is set to English
    /// ENDPOINT
    baseUrl = 'http://api.mediastack.com/v1/news?access_key=d40f9dc9234a1b84560ac1a3c0a296c6';
    
    print([baseUrl]);
    // calling the API function and passing the URL here
    getBreakingNewsFromApi(baseUrl);
  }

  // function to load and display all news and searched news on to UI
  getAllNews({channel = '', searchKey = '', reload = false}) async {
    articleNotFound.value = false;

    if (!reload && isLoading.value == false) {
    } else {
      country.value = '';
      category.value = '';
    }
    if (isLoading.value == true) {
      pageNum++;
    } else {
      allNews = [];
      pageNum.value = 2;
    }
    // ENDPOINT
    baseUrl = "http://api.mediastack.com/v1/news?access_key=d40f9dc9234a1b84560ac1a3c0a296c6";
    
  
    
    print(baseUrl);
    // calling the API function and passing the URL here
    getAllNewsFromApi(baseUrl);
  }

  // function to retrieve a JSON response for breaking news from newsApi.org
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
          // combining two list instances with spread operator
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

  // function to retrieve a JSON response for all news from newsApi.org
  getAllNewsFromApi(url) async {
    //Creates a new Uri object by parsing a URI string.
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));

      if (newsData.articles.isEmpty && newsData.totalResults == 0) {
        articleNotFound.value = isLoading.value == true ? false : true;
        isLoading.value = false;
        update();
      } else {
        if (isLoading.value == true) {
          // combining two list instances with spread operator
          allNews = [...allNews, ...newsData.articles];
          update();
        } else {
          if (newsData.articles.isNotEmpty) {
            allNews = newsData.articles;
            // list scrolls back to the start of the screen
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