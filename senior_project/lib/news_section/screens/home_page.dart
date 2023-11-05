import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_project/news_section/constants/constants.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/widgets/custom_appBar.dart';
import 'package:senior_project/news_section/widgets/side_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  NewsController newsController = Get.put(NewsController());

  // Function to show the WelcomePage as a popup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideDrawer(context, newsController),
      appBar: customAppBar('Threat Detection Hub', context, actions: []),
      body: Obx(() {
        if (newsController.isLoading.value && newsController.allNews.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<NewsController>(
                  init: NewsController(),
                  builder: (controller) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: controller.breakingNews.map((instance) {
                        return controller.articleNotFound.value
                            ? const Center(
                                child: Text("Not Found",
                                    style: TextStyle(fontSize: 30)),
                              )
                            : controller.breakingNews.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Builder(builder: (BuildContext context) {
                                    try {
                                      return Banner(
                                        location: BannerLocation.topStart,
                                        message: 'Top Headlines',
                                        child: InkWell(
                                          onTap: () async {
                                            String articleUrl = instance.url;
                                            if (await canLaunch(articleUrl)) {
                                              await launch(articleUrl);
                                            } else {
                                              print(
                                                  'Could not launch $articleUrl');
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  instance.urlToImage ?? " ",
                                                  fit: BoxFit.fill,
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      child: const SizedBox(
                                                        height: 200,
                                                        width: double.infinity,
                                                        child: Icon(Icons
                                                            .broken_image_outlined),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.black12
                                                            .withOpacity(0),
                                                        Colors.black,
                                                      ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 5,
                                                      vertical: 10,
                                                    ),
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Text(
                                                        instance.title,
                                                        style: const TextStyle(
                                                          fontSize:
                                                              Sizes.dimen_16,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } catch (e) {
                                      if (kDebugMode) {
                                        print(e);
                                      }
                                      return Container();
                                    }
                                  });
                      }).toList(),
                    );
                  },
                ),
                const Divider(),
                GetBuilder<NewsController>(
                  init: NewsController(),
                  builder: (controller) {
                    return controller.articleNotFound.value
                        ? const Center(child: Text('Nothing Found'))
                        : controller.allNews.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.allNews.length,
                                itemBuilder: (context, index) {
                                  index == controller.allNews.length - 1 &&
                                          controller.isLoading.isTrue
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : const SizedBox();
                                  return InkWell(
                                    onTap: () async {
                                      String articleUrl =
                                          controller.allNews[index].url;
                                      if (await canLaunch(articleUrl)) {
                                        await launch(articleUrl);
                                      } else {
                                        print('Could not launch $articleUrl');
                                      }
                                    },
                                  );
                                },
                              );
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
