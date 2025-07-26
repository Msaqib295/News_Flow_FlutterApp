import 'package:flutter/material.dart';
import 'package:news_flow_flutterapp/model/newsArt.dart';
import 'package:news_flow_flutterapp/view/controller/fetchNews.dart';
import 'package:news_flow_flutterapp/view/widget/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController(initialPage: 0, keepPage: true);
  List<NewsArt> newsList = [];
  bool isInitialLoading = true;
  bool isFetchingMore = false;

  @override
  bool get wantKeepAlive => true;

  Future<void> prefetchInitialNews(int count) async {
    try {
      for (int i = 0; i < count; i++) {
        final newsArt = await FetchNews.fetchNews();
        newsList.add(newsArt);
      }
    } catch (e) {
      debugPrint('Error prefetching news: $e');
    } finally {
      setState(() {
        isInitialLoading = false;
      });
    }
  }

  Future<void> getMoreNews() async {
    if (isFetchingMore) return;
    setState(() {
      isFetchingMore = true;
    });
    try {
      final newsArt = await FetchNews.fetchNews();
      setState(() {
        newsList.add(newsArt);
      });
    } catch (e) {
      debugPrint('Error fetching more news: $e');
    } finally {
      setState(() {
        isFetchingMore = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    prefetchInitialNews(5);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: isInitialLoading
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          if (index >= newsList.length - 2) {
            getMoreNews();
          }
        },
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return Stack(
            children: [
              NewsContainer(
                imgUrl: news.imgUrl,
                newsHead: news.newsHead,
                newsCnt: news.newsCnt,
                newsDes: news.newsDes,
                newsUrl: news.newsUrl,
              ),
              if (isFetchingMore && index == newsList.length - 1)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
