import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newapp/src/utils/app_color.dart';

import '../../model/show_category.dart';
import '../../services/show_category.dart';
import '../Home/blog_tile.dart';

class CategoryNews extends StatefulWidget {
  final String name;

  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews service = ShowCategoryNews();
    await service.getcategoriesNews(widget.name);
    categories = service.categories;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name.toUpperCase(),
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: AppColors.primaryRed),
        ),
        centerTitle: true,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final news = categories[index];
          return BlogTile(
            title: news.title ?? "",
            desc: news.description ?? "",
            imageUrl: news.urlToImage ?? "",
            url: news.url ?? "",
          );
        },
      ),
    );
  }
}
