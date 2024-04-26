import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_disease_detector/screens/about.dart';
import 'package:orange_disease_detector/screens/fruitDetection/home.dart';

import '../../constants/colors.dart';
import '../../customeAnimations/fade_in_slide.dart';
import '../../utils/asset_utils/assets_util.dart';
import '../../widgets/customeButton.dart';
import '../homeMain.dart';

class ResultPage extends StatelessWidget {
  final String? result;
  final String? reccomandation;
  final File? image;

  const ResultPage(
      {super.key, required this.result, required this.reccomandation, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInSlide(
                  duration: 1.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    child: Image.asset(Assets.orangeLogo2),
                  )),

              Row(
                children: [
                  Text(
                    'Diagnosis results',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Pallete.onePrimaryColor),
                  ),
                ],
              ),
              SizedBox(width: 10,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.grey.withOpacity(0.2)

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      image != null ? Container(
                        width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: Image.file(image!))) : Container(),
SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Disease Name:              ",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800),
                          ),
                          Text(
                            result!,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       result!,
              //       style: GoogleFonts.poppins(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.grey.shade800),
              //     ),
              //   ],
              // ),

              SizedBox(
                height: 10,
              ),
              FadeInSlide(
                  duration: 1.0,
                  child: Divider(color: Colors.grey.withOpacity(0.2))),


              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Recommendations',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Pallete.onePrimaryColor),
                  ),
                ],
              ),



              SizedBox(
                height: 10,
              ),

              Text(
                reccomandation!,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              ),

              const SizedBox(
                height: 16,
              ),
              FadeInSlide(
                  duration: 1.0,
                  child: Divider(color: Colors.grey.withOpacity(0.2))),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Image.network('https://cdn-icons-png.flaticon.com/128/3792/3792646.png', color: Pallete.onePrimaryColor,width: 30),
                  SizedBox(width: 20,),
                  Text(
                    "Organic Control",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Pallete.onePrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Discover organic solutions for keeping your citrus trees healthy and thriving. Explore natural methods to control pests and diseases, ensuring a bountiful harvest while staying true to environmentally-friendly practices",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:Colors.grey.shade800),
              ),

              // Text(result),
              // Text(reccomandation),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: FadeInSlide(
              duration: 2.0,
              child: CustomButton(
                btnColor: Pallete.onePrimaryColor,
                width: 140,
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
          Container(
            padding: EdgeInsets.all(20),
            child: FadeInSlide(
              duration: 2.0,
              child: CustomButton(
                btnColor: Pallete.onePrimaryColor,
                width: 140,
                borderRadius: 10,
                child: Text(
                  '@\nAbout',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(),));
                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}
