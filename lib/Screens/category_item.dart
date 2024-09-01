import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
   CategoryItem({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: model.color,
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Text(model.name,style: TextStyle(
            fontSize:20,color: Colors.white,
          ),),
        ],
      ),
    );
  }
}
