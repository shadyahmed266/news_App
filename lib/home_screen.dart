import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_fragments.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/search/news_search.dart';
import 'package:news_app/settings/settings_tab.dart';

import 'drawer/home_drawer.dart';
import 'my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset("assets/images/background.png",
            width: double.infinity, height: double.infinity, fit: BoxFit.cover),
      ),
      Scaffold(

          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    openPageSearch();
                  },
                  icon: Icon(
                    color: Colors.white,
                    Icons.search,
                    size: 30,
                  )),
            ],
            title: Text(
              selectedMenuItem == HomeDrawer.settings
                  ? "Settings"
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          drawer: Drawer(
            shadowColor:Colors.transparent ,
            backgroundColor: Colors.white,
            child: HomeDrawer(
                OnSideMenuItemClick: onSideMenuItemClick),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                  : CategoryDetails(category: selectedCategory!))
    ]);
  }

  CategoryDM? selectedCategory;

  void onCategoryItemClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
  void openPageSearch() {
    showSearch(context: context, delegate: NewsSearch());
  }
}
