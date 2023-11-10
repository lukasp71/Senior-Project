import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:senior_project/news_section/constants/constants.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/widgets/side_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Threat Detection Hub',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: sideDrawer(context, newsController),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GetBuilder<NewsController>(
              init: NewsController(),
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.breakingNews.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final instance = controller.breakingNews[index];
                    return InkWell(
                      onTap: () async {
                        String articleUrl = instance.url;
                        if (await canLaunch(articleUrl)) {
                          await launch(articleUrl);
                        } else {
                          print('Could not launch $articleUrl');
                        }
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 150), // Maximum width for the Card
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  instance.urlToImage ?? "",
                                  fit: BoxFit.fill,
                                  height: 150,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black12.withOpacity(0),
                                      Colors.black,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    instance.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Divider(),
            GetBuilder<NewsController>(
              init: NewsController(),
              builder: (controller) {
                return controller.articleNotFound.value
                    ? Center(child: Text('Nothing Found'))
                    : controller.allNews.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: controller.allNews.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final instance = controller.allNews[index];
                              return InkWell(
                                onTap: () async {
                                  String articleUrl = instance.url;
                                  if (await canLaunch(articleUrl)) {
                                    await launch(articleUrl);
                                  } else {
                                    print('Could not launch $articleUrl');
                                  }
                                },
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 150), // Maximum width for the Card
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            instance.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            instance.description ?? '',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
              },
            ),
          ],
        ),
      ),
    );
  }
}