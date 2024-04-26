import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_disease_detector/screens/homeMain.dart';

import '../constants/colors.dart';
import '../customeAnimations/fade_in_slide.dart';
import '../utils/asset_utils/assets_util.dart';
import '../widgets/customeButton.dart';
import 'fruitDetection/home.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FadeInSlide(
                duration: 1.0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 200,
                  child: Image.asset(Assets.orangeLogo2),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Introducing the Orange Disease Detector App: Empowering Farmers with Leaf and Plant Health Insights',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'In today\'s digital age, technology continues to revolutionize various industries, and agriculture is no exception. Recognizing the critical importance of disease detection in orange crops, a cutting-edge solution has emerged: the Orange Disease Detector App.',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'The Orange Disease Detector App is a user-friendly and powerful mobile application designed to assist farmers in identifying and addressing diseases affecting both orange leaves and plants. By harnessing the capabilities of smartphones and advanced image recognition algorithms, this app provides farmers with a convenient and efficient tool to monitor the health of their orange crops.',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          Container(
            padding: EdgeInsets.all(20),
            child: FadeInSlide(
              duration: 2.0,
              child: CustomButton(
                btnColor: Pallete.onePrimaryColor,
                width: screenWidth,
                borderRadius: 10,
                child: Text(
                  '@\nBack',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));

                },
              ),
            ),
          ),



    );
  }
}
