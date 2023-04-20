import 'package:flutter/material.dart';
import 'package:news_app_json/screen/news_json/provider/news_provider.dart';
import 'package:provider/provider.dart';

class News_screen extends StatefulWidget {
  const News_screen({Key? key}) : super(key: key);

  @override
  State<News_screen> createState() => _News_screenState();
}

class _News_screenState extends State<News_screen> {
  @override
  void initState() {
    Provider.of<News_Provider>(context, listen: false).NewsApiCall();
    super.initState();
  }

  News_Provider? news_providert, news_providerf;

  @override
  Widget build(BuildContext context) {
    news_providerf = Provider.of<News_Provider>(context, listen: false);
    news_providert = Provider.of<News_Provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("24/7 News"),
          centerTitle: true,
          leading: Icon(Icons.newspaper_outlined),
          backgroundColor: Colors.black,
          actions: [
            Icon(Icons.menu),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  news_providerf!.NewsApiCall();
                },
                child: Text("News",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueGrey)),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                       child: Container(
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                        child: ListTile(
                          // leading: Text("${news_providert!.NewsList![index].author}"),
                          title: Text("${news_providert!.NewsList![index].author}"),
                          subtitle:
                              Text("${news_providert!.NewsList![index].title}"),
                          trailing: Container(
                            height: 150,
                            width:100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.purple.shade100, width: 2),
                            ),
                            child: Image.network(
                              "${news_providert!.NewsList[index].urltoimg}",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: news_providerf!.NewsList.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
