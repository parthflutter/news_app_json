import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import '../model/news_model.dart';


class News_Provider extends ChangeNotifier {
  List<dynamic> NewsList = [];

  var i;

  Future<void> NewsApiCall() async {
    String newslink =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-03-05&sortBy=publishedAt&apiKey=0afb8b0d5da44e9d951dacd85c40d453";

    Uri uri = Uri.parse(newslink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);

    NewsModel newsModel = NewsModel().newsFromJson(json);
    NewsList = newsModel.articleList!;
    notifyListeners();
    }

  void selectIndex(int value) {}
}
