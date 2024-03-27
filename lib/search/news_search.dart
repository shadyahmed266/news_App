import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/news/news_item.dart';
import '../model/NewsResponse.dart';
import '../news/news_widget.dart';

class NewsSearch extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme:
          InputDecorationTheme(hintStyle: TextStyle(color: Colors.white)),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) return;
          showResults(context);
        },
        icon: const Icon(
          color: Colors.white,
          Icons.search,
          size: 30,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          color: Colors.white,
          Icons.clear,
          size: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: FutureBuilder<NewsResponse?>(
          future: ApiManager.searchNews(query),
          builder: (buildContext, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                  itemCount: snapShot.data!.articles!.length,
                  itemBuilder: (context, index) {
                    return NewsItem(news: snapShot.data!.articles![index]);
                  });
            } else if (snapShot.hasError) {
              return Center(
                child: Text(snapShot.error.toString()),
              );
            } else {
              return Center(
                child:
                    CircularProgressIndicator(color: MyTheme.primaryLightColor),
              );
            }
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child:
            Text('Suggestions', style: Theme.of(context).textTheme.titleSmall));
  }
}
