import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
CategoryDM category ;
int index ;

  CategoryItem({required this.category,required this.index});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 :0 ),
          bottomRight: Radius.circular(index % 2 == 0 ? 0: 25)

        ),
        color: category.color
      ),
child: Column(
   children: [
     Image.asset(category.imagePath,
     height: MediaQuery.of(context).size.height*.15,
     ),
     Text(category.title,
     style: Theme.of(context).textTheme.titleLarge,
     )
     
     
   ],
),

    );
  }
}
