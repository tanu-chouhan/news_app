import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:newapp/src/model/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews()async{
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2025-11-18&sortBy=publishedAt&apiKey=51806c24c6074abfa4856291adbdc56e";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null){
           ArticleModel articleModel = ArticleModel(
             title: element["title"],
             description: element["descrption"],
             content: element["content"],
             author: element["author"],
             url: element["url"],
             urlToImage: element["urlToImage"]

           );
           news.add(articleModel);
        }
      });
    }

  }
}