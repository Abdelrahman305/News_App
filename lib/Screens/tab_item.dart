import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/SourseRespones.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
   TabItem({required this.sources ,required this.isSelected,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green),
      ),
      child: Text(sources.name??"",style:  TextStyle(
        color: isSelected ?Colors.white:Colors.green
      ),),
    );
  }
}
