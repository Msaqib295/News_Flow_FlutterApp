import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_flow_flutterapp/model/newsArt.dart';

class FetchNews {
  static List sourcesID = [
    "abc-news",
    "al-jazeera-english",
    "ars-technica",
    "ary-news",
    "associated-press",
    "bbc-news",
    "bbc-sport",
    "bleacher-report",
    "bloomberg",
    "business-insider",
    "buzzfeed",
    "cbs-news",
    "cnn",
    "crypto-coins-news",
    "entertainment-weekly",
    "espn-cric-info",
    "fortune",
    "four-four-two",
    "fox-news",
    "google-news",
    "google-news-in",
    "hacker-news",
    "ign",
    "medical-news-today",
    "mtv-news",
    "national-geographic",
    "nbc-news",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "politico",
    "recode",
    "talksport",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-next-web",
    "the-wall-street-journal",
    "the-verge",
    "time",
    "usa-today",
    "wired"
  ];

  static Future<NewsArt> fetchNews() async {
    final _random = Random();
    var sourceID = sourcesID[_random.nextInt(sourcesID.length)];
    print("📰 Source: $sourceID");

    try {
      Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=d5840b4804c2471290988b1f69c09d9a",
      ));

      Map body_data = jsonDecode(response.body);
      print("🌐 API Response: ${body_data['status']}");

      // Check if the response contains articles
      if (body_data["articles"] == null || body_data["articles"].isEmpty) {
        print("⚠️ No articles found or rate-limited");
        throw Exception("No news found for this source.");
      }

      List articles = body_data["articles"];
      print("✅ Articles loaded: ${articles.length}");

      var myArticle = articles[_random.nextInt(articles.length)];
      print("🗞️ Selected article: ${myArticle['title']}");

      return NewsArt.fromAPItoApp(myArticle);
    } catch (e) {
      print("🚨 Error prefetching news: $e");

      // Optional: Return a fallback NewsArt so app doesn't crash
      return NewsArt(
        imgUrl: '',
        newsHead: 'No news available',
        newsDes: '',
        newsCnt: '',
        newsUrl: '',
      );
    }
  }
}
