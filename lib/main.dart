import 'package:flutter/material.dart';
import 'package:news_app_json/screen/news_json/provider/news_provider.dart';
import 'package:news_app_json/screen/news_json/view/news_scrren.dart';
import 'package:news_app_json/screen/tabbar/view/tabbar_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => News_Provider(),
        ),
      ],

      child: MaterialApp(debugShowCheckedModeBanner: false,
        routes: {
        '/':(context) =>Tabbar_screen(),
          'News_screen':(context) => News_screen(),

      },
      ),
    ),
  );
}
