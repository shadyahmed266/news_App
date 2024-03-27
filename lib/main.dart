import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/news/news_details.dart';

import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        // CategoryDetails.routeName: (context) => CategoryDetails(),
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetails.routeName: (context) =>  NewsDetails(),

      },
      theme: MyTheme.lightTheme,
    );
  }
}
