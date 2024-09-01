import 'package:flutter/cupertino.dart';
import 'package:news_app/models/NewsData.dart';

class NewsItem extends StatelessWidget {
  Articles article;
   NewsItem({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(article.urlToImage??"")),
          Text(article.author??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          Text(article.title??""),
          Text(article.description??""),
          Text(article.publishedAt!.substring(0,10)??"",textAlign: TextAlign.end,),
        ],
      ),
    );
  }
}
