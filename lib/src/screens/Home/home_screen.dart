import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newapp/src/model/article_model.dart';
import 'package:newapp/src/model/category_model.dart';
import 'package:newapp/src/model/slider_model.dart';
import 'package:newapp/src/screens/Home/category_tile.dart';
import 'package:newapp/src/screens/Slider/slider_screen.dart';
import 'package:newapp/src/services/data.dart';
import 'package:newapp/src/services/news.dart';
import 'package:newapp/src/services/show_category.dart';
import 'package:newapp/src/services/slider_data.dart';
import 'package:newapp/src/utils/app_assets.dart';
import 'package:newapp/src/utils/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'blog_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  int activeIndex = 0;
  bool _newsLoading = true;
  bool _sliderLoading = true;


  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
      _newsLoading = false;
    });
  }


  getSlider()async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      _loading = false;
    });
  }
  // getCategories()async{
  //   ShowCategoryNews showCategoryNews = ShowCategoryNews();
  //   await showCategoryNews.getcategoriesNews(category)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: .center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: GoogleFonts.poppins(
                fontWeight: .bold,
                color: AppColors.primaryRed,
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: .horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            image: categories[index].image,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Breaking News!",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: .bold,
                            ),
                          ),
                          Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: .w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CarouselSlider.builder(
                      itemCount: sliders.length,
                      itemBuilder: (context, index, realIndex) {
                        String? res = sliders[index].urlToImage;
                        String? res1 = sliders[index].title;
                        return buildImage(res!, index, res1!);
                      },
                      options: CarouselOptions(
                        height: 250,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(child: buildIndicator()),

                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Trending News!",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: .bold,
                            ),
                          ),
                          Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: .w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TRENDING NEWA SECTION
                    SizedBox(height: 10),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: BlogTile(
                              url: articles[index].url ?? "",
                              title: articles[index].title ?? "",
                              imageUrl: articles[index].urlToImage ?? "oops!",
                              desc: articles[index].description
                                  ?? articles[index].content
                                  ?? "No description available",

                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  //BUILDIMAGE WIDGET

  Widget buildImage(String image, int index, String name) => InkWell(

    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>SliderScreen(blogUrl:  sliders[index].url!)));
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: .circular(10),
            child: CachedNetworkImage(
              imageUrl:image,
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 170),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: .only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: .bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  //BUILDINDICATOR WIDGET

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: sliders.length,
    effect: WormEffect(
      dotHeight: 10,
      dotWidth: 10,
      spacing: 8,
      dotColor: Colors.grey.shade400,
      activeDotColor: AppColors.primaryRed,
    ),
  );
}
