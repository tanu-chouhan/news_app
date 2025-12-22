import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:newapp/src/model/article_model.dart';
import 'package:newapp/src/model/show_category.dart';
import 'package:newapp/src/model/slider_model.dart';

class ShowCategoryNews{
  List<ShowCategoryModel> categories = [];

  Future<void> getcategoriesNews(String category)async{
    categories.clear();
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=51806c24c6074abfa4856291adbdc56e";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null){
          ShowCategoryModel categoryModel = ShowCategoryModel(
              title: element["title"],
              description: element["description"],
              content: element["content"],
              author: element["author"],
              url: element["url"],
              urlToImage: element["urlToImage"]

          );
          categories.add(categoryModel);

        }
      });
    }

  }
}