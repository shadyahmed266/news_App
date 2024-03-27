import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager {
//   https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.basrUrl, ApiConstants.sourcesApi,
        {"apiKey": "3c13ee42b13f41929d258fe949bb9513", 'category': categoryId,'lang':'en'});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      // print(responseBody);
      //// json
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  //https://newsapi.org/v2/everything?&apiKey=3c13ee42b13f41929d258fe949bb9513

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.basrUrl, ApiConstants.newsApi,
        {"apiKey": "3c13ee42b13f41929d258fe949bb9513", "sources": sourceId,'lang':'en'});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  // static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
  //   Uri url = Uri.https(ApiConstants.basrUrl, ApiConstants.newsApi,
  //       {"apiKey": "3c13ee42b13f41929d258fe949bb9513", "sources": sourceId});3
  //   try {
  //     var response = await http.get(url);
  //     var responseBody = response.body;
  //     var json = jsonDecode(responseBody);
  //     return NewsResponse.fromJson(json);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  static Future<NewsResponse?> searchNews(String query) async {
    Uri url = Uri.https(ApiConstants.basrUrl, ApiConstants.newsApi,
        {"apiKey": "3c13ee42b13f41929d258fe949bb9513", "q": query,'lang':'en'});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      print(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
