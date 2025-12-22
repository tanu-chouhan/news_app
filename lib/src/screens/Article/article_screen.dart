import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/app_color.dart';

class ArticleScreen extends StatefulWidget {
  String blogUrl;
   ArticleScreen({required this.blogUrl});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  final controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(widget.blogUrl));
  }

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
      body:Container(
      child:WebViewWidget(controller: controller),
    )
    );
  }
}
