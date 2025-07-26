import 'package:flutter/material.dart';
import 'package:news_flow_flutterapp/news_webview.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDes;
  final String newsCnt;
  final String newsUrl;

  const NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsCnt,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imgUrl,
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 400,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    height: 400,
                    child: Center(child: Icon(Icons.broken_image, size: 80, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsHead.length > 90 ? "${newsHead.substring(0, 90)}..." : newsHead,
                        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        newsDes,
                        style: const TextStyle(fontSize: 12, color: Colors.black38),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        newsCnt.length > 100 ? "${newsCnt.substring(0, 100)}..." : newsCnt,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewsWebView(url: newsUrl),
                  ),
                );
              },
              child: const Text("Read More"),
            ),
          ),
        ],
      ),
    );
  }
}
