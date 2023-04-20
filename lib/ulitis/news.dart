import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  Future<void> postApiCall() async {
    String apilink =
        // "https://newsapi.org/v2/everything?q=tesla&from=2023-03-05&sortBy=publishedAt&apiKey=421bf1b94b28421cbaeb97808a515ae8";
    "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0afb8b0d5da44e9d951dacd85c40d453";


    Uri uri = Uri.parse(apilink);
    var response = await http.get(uri);


    var json = jsonDecode(response.body);
  }
}
