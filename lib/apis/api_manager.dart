import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/SourseRespones.dart';
import 'package:news_app/models/NewsData.dart';

class ApiManager{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=a9588d053f5b47f69f1476acaff91907

   static Future<SourseResponse>getSourses(String id)async{

    Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources",
    {
      "apiKey":"a9588d053f5b47f69f1476acaff91907",
      "Category":id,
    });
   http.Response response=await http.get(url);
   Map<String,dynamic>jsonFormat=jsonDecode(response.body);
   SourseResponse sourseResponse=SourseResponse.fromJson(jsonFormat);
   return sourseResponse;
  }

  static Future<NewsDataRespones>getNewsData(String sourceId)async{
     //https://newsapi.org/v2/everything?q=bitcoin&apiKey=a9588d053f5b47f69f1476acaff91907
    Uri url=Uri.https("newsapi.org","/v2/everything",
    {
      "apiKey":"a9588d053f5b47f69f1476acaff91907",
      "sources":sourceId,
    }
    );
    http.Response response=await http.get(url);
    var jsonFormat=jsonDecode(response.body);
    NewsDataRespones newsDataRespones=NewsDataRespones.fromJson(jsonFormat);
    return newsDataRespones;

  }
}