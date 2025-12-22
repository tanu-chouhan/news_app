import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newapp/src/screens/Home/home_screen.dart';
import 'package:newapp/src/utils/app_assets.dart';
import 'package:newapp/src/utils/app_color.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Material(
              borderRadius: .circular(30),
              elevation: 3,
              child: ClipRRect(
                borderRadius: .circular(30),
                child: Image.asset(
                  AppAssets.building,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "News from around the\n          world for you",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Best time to read,take your time to read\n        a little more of this world",
              style: GoogleFonts.poppins(
                color: Colors.black45,
                fontSize: 18,
                fontWeight: .w500,
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Material(
                borderRadius: .circular(30),
                elevation: 5,
                child: InkWell(
                  borderRadius: .circular(30),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: .circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: .w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
