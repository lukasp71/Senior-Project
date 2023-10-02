import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// Import necessary libraries for thenewsapi integration

void main() {
  WebViewPlatform.instance = WebWebViewPlatform();
  runApp(const MaterialApp(home: WebViewExample()));
}

class WebViewExample extends StatefulWidget {
  const WebViewExample();

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late YoutubePlayerController _youtubeController;

  // TODO: Integrate the fetching of articles from thenewsapi

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'inWWhr5tnEA',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    // TODO: Fetch articles on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cybersecurity News and Resources'),
      ),
      body: Column(
        children: [
          // Carousel Slider containing WebView with different cybersecurity news websites
          CarouselSlider(
            items: [
              // _buildWebViewItem('https://www.cyberscoop.com/'),
              _buildWebViewItem('https://threatpost.com/'),
              //_buildWebViewItem('https://www.darkreading.com/'),
              // Add more websites as needed
            ],
            options: CarouselOptions(
              height: 200,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              //autoPlay: true,
              //autoPlayInterval: Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {});
              },
            ),
          ),
          // Display articles from thenewsapi
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with your articles length
              itemBuilder: (context, index) {
                // TODO: Replace with actual articles content
                return ListTile(title: Text('Article $index'));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebViewItem(String url) {
    final controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
        LoadRequestParams(uri: Uri.parse(url)),
      );

    return Container(
      height: 200,
      child: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: controller),
      ).build(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _youtubeController.dispose();
  }
}
