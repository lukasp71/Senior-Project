import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    if (isFirstLaunch) {
      await prefs.setBool('isFirstLaunch', false);
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _showWelcomeDialog();
      });
    }
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Welcome to Threat Awareness Hub'),
          content: const Text(
              'Welcome to Threat Awareness Hub, your one-stop for Cybersecurity News and Education. Take a look at the most recent cybersecurity news and vulnerabilities, as well as learn the basics of various cybersecurity concepts for you or your business.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                    String imageUrl = instance.urlToImage ?? "";

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
                            FutureBuilder(
                              future: _getImageSize(imageUrl),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  ImageInfo? imageInfo =
                                      snapshot.data as ImageInfo?;
                                  bool usePlaceholder = false;

                                  if (imageInfo != null &&
                                      (imageInfo.image.width ?? 0) < 600 &&
                                      (imageInfo.image.height ?? 0) < 600) {
                                    usePlaceholder = true;
                                  }

                                  return Container(
                                    height: 300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: usePlaceholder
                                          ? Image.asset(
                                              'assets/cyber_background.jpg',
                                              fit: BoxFit.cover,
                                              height: double.infinity,
                                              width: double.infinity,
                                            )
                                          : Image.network(
                                              imageUrl,
                                              fit: BoxFit.cover,
                                              height: double.infinity,
                                              width: double.infinity,
                                              errorBuilder: (context, error,
                                                  stackTrace) {
                                                return Image.asset(
                                                  'assets/cyber_background.jpg',
                                                  fit: BoxFit.cover,
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                );
                                              },
                                            ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: 300,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              },
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

  Future<ImageInfo?> _getImageSize(String imageUrl) async {
    Completer<ImageInfo?> completer = Completer();
    final Image image = Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          completer.complete(image);
        },
        onError: (dynamic exception, StackTrace? stackTrace) {
          completer.completeError(exception);
        },
      ),
    );

    return completer.future;
  }
}