import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Category/category_news.dart';

class CategoryTile extends StatelessWidget {
  final String image;
  final String categoryName;

  CategoryTile({
    required this.categoryName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryNews(
              name: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            children: [
              Image.asset(
                image,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
              Container(
                width: 120,
                height: 60,
                color: Colors.black38,
                alignment: Alignment.center,
                child: Text(
                  categoryName,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
