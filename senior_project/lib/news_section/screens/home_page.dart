// ignore_for_file: deprecated_member_use, avoid_print, use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_project/database/services/databse.dart';
import 'package:senior_project/news_section/screens/welcome_pupup.dart';
import 'package:senior_project/news_section/widgets/appBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:senior_project/news_section/controllers/news_controller.dart';
import 'package:senior_project/news_section/models/article_model.dart'; // Import your updated ArticleModel
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.put(NewsController());
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
    _checkUserLogin();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  late DatabaseService service;
  Future<void> _checkUserLogin() async {
    if (auth.currentUser != null) {
      User? user = FirebaseAuth.instance.currentUser;
      service = DatabaseService(uid: user!.uid);
      isLoggedIn = true;
    }
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    if (isFirstLaunch) {
      await prefs.setBool('isFirstLaunch', false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showWelcomeDialog();
      });
    }
  }

  void _showWelcomeDialog() {
    return WelcomePopup.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppBar(currentSection: 'News', backArrow: false),
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
                                  ImageInfo? imageInfo = snapshot.data;
                                  bool usePlaceholder = false;

                                  if (imageInfo != null &&
                                      (imageInfo.image.width) < 600 &&
                                      (imageInfo.image.height) < 600) {
                                    usePlaceholder = true;
                                  }

                                  return SizedBox(
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
                                              errorBuilder:
                                                  (context, error, stackTrace) {
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
                                  return const SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 8),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        instance.title,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Flexible(
                                      child: Text(
                                        instance.description ?? '',
                                        style: const TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // Favorite button
                                    if (isLoggedIn)
                                      Tooltip(
                                        message: instance.isFavorite
                                            ? 'Remove from Saved Articles'
                                            : 'Save this Article',
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.star,
                                            color: instance.isFavorite
                                                ? Colors.blue
                                                : null,
                                          ),
                                          onPressed: () async {
                                            // Save the updated favorite status
                                            _saveFavoriteStatus(instance);
                                          },
                                        ),
                                      ),
                                  ],
                                ),
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

  // Helper method to save the favorite status in shared preferences
  Future<void> _saveFavoriteStatus(ArticleModel article) async {
    if (!isLoggedIn) {
      // Do not proceed if the user is not logged in
      return;
    }

    try {
      // Get the current user's ID from Firebase Authentication
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      // Reference to the user's document in the "User" collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('User').doc(userId);

      // Get the current user's favURLs
      List<String> currentFavURLs = [];
      List<String> savedTitles = [];
      DocumentSnapshot userSnapshot = await userRef.get();
      if (userSnapshot.exists && userSnapshot.data() != null) {
        var userData = userSnapshot.data() as Map<String, dynamic>;
        currentFavURLs = List<String>.from(userData['favURLs'] ?? []);
        savedTitles = List<String>.from(userData['savedTitles'] ?? []);
      }

      // Check if the article is already in favorites
      bool isInFavorites = currentFavURLs.contains(article.url);

      if (isInFavorites) {
        // Show confirmation dialog
        bool removeConfirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Remove from Favorites'),
              content: const Text(
                  'Are you sure you want to remove this article from your favorites?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Remove'),
                ),
              ],
            );
          },
        );

        // If the user confirmed removal, update the UI and remove from favorites
        if (removeConfirmed) {
          setState(() {
            article.isFavorite = false;
          });

          // Remove from favorites
          currentFavURLs.remove(article.url);
          savedTitles.remove(article.title);
        }
      } else {
        // Toggle the favorite status
        setState(() {
          article.isFavorite = true;
        });

        // Add to favorites
        currentFavURLs.add(article.url);
        savedTitles.add(article.title);
      }

      // Update the user's document with the new favURLs
      await userRef.update({'favURLs': currentFavURLs});
      await userRef.update({'savedTitles': savedTitles});
      // Optional: Update the local UI to reflect the change
    } catch (error) {
      print('Error updating favURLs: $error');
      // Handle the error as needed
    }
  }
}
