import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';

class HomePage extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppBar(currentSection: 'News'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GetBuilder<NewsController>(
              builder: (controller) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.breakingNews.length,
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
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 300, // Set a fixed height for the Card
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  instance.urlToImage ?? "",
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    instance.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    instance.description ?? '',
                                    style: const TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
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