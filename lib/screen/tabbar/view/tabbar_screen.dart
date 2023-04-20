import 'package:flutter/material.dart';
import 'package:news_app_json/screen/news_json/provider/news_provider.dart';
import 'package:news_app_json/screen/news_json/view/news_scrren.dart';
import 'package:provider/provider.dart';

class Tabbar_screen extends StatefulWidget {
  const Tabbar_screen({Key? key}) : super(key: key);

  @override
  State<Tabbar_screen> createState() => _Tabbar_screenState();
}
class _Tabbar_screenState extends State<Tabbar_screen> {
  News_Provider?news_providert,news_providerf;
  List Screen=[News_screen()];
  @override
  Widget build(BuildContext context) {
    news_providerf=Provider.of<News_Provider>(context,listen: false);
    news_providert=Provider.of<News_Provider>(context,listen: true);
    return DefaultTabController(length: 1,
      child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
       appBar: AppBar(
         title: Text("24/7 News"),
         backgroundColor: Colors.black,
         bottom: TabBar(
           tabs: [
             Tab(
               text: "Top News",
             ),
             Tab(
               text: "Country",
             ),
             Tab(
               text: "Health",
             ),
             Tab(
               text: "Business",
             ),
             Tab(
               text: "Sports",
             ),

           ],
         ),
       ),
         body: TabBarView(
           children: [
             News_screen(),
           ],
         ),

      ),
    ),
    );
  }
}
