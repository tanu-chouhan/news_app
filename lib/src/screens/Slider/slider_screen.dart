import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/app_color.dart';

class SliderScreen extends StatefulWidget {
  String blogUrl;
  SliderScreen({required this.blogUrl});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

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
