import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;

  Function OnSideMenuItemClick ;
  HomeDrawer({required this.OnSideMenuItemClick});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          color: MyTheme.primaryLightColor,
          child: Text(
            "News App!",
            style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,

          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: (){
              OnSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10,),
                Text("Categories",
                style: Theme.of(context).textTheme.titleMedium),

              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: (){
              OnSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text("Settings",
                    style: Theme.of(context).textTheme.titleMedium),

              ],
            ),
          ),
        )
      ],
    );
  }
}
