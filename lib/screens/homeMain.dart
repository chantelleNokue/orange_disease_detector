
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_disease_detector/customeAnimations/fade_in_slide.dart';

import '../constants/colors.dart';
import '../utils/asset_utils/assets_util.dart';
import 'fruitDetection/home.dart';
import 'leafDetection/homeLeafDetection.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.orange.shade200
              ]
          ),
          image: DecorationImage(
              fit: BoxFit.contain,
              opacity: 0.6,
              alignment: Alignment.topCenter,
              image: AssetImage(
                  Assets.orangeLogo2,
              )
          )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset(
            //       Assets.eezimedzLogo,
            //       width: 150,
            //     ),
            //   ],
            // ),

            SizedBox(
              height: 400,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                        color: Pallete.onePrimaryColor
                    )

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Welcome to Orange Disease Detection\nStay Ahead of Citrus Troubles: Detect Orange Diseases Effortlessly',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Pallete.onePrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: FadeInSlide(
          duration: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            height: 320,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                          color: Pallete.onePrimaryColor
                      )

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                            "Time to decide: Select your next move",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Pallete.onePrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            )
                        ),

                        Text(
                            "Choose what you want to do with out app",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Pallete.onePrimaryColor,
                              fontSize: 12,
                            )
                        ),
                      ],
                    ),
                  ),
                ),



                SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20,),
                        Container(
                          width: 180,
                          child: roleWidget(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePageLeaf())),
                              color:   Colors.transparent,
                              textIconColour:  Colors.black38,
                              center: "Detect",
                              bottom: "Leaf",
                              icon: Icons.library_books
                          ),
                        ),




                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20,),
                        Container(
                          width: 180,
                          child: roleWidget(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePage())),
                              color:  Colors.transparent,
                              textIconColour:  Colors.black38 ,
                              center: "Detect",
                              bottom: "Fruit",
                              icon: Icons.library_books
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 8,
                    ),


                  ],
                ),

                SizedBox(
                  height: 12,
                ),



              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget roleWidget({required Color color, required Color textIconColour, required void Function() onTap, required String center, required IconData icon, required String bottom}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: Pallete.onePrimaryColor
            )
        ),

        child: Row(
          children: [

            Icon(
              icon,
              color: textIconColour,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "$center\n$bottom",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: textIconColour,
                fontWeight: FontWeight.bold,

              ),
            )
          ],
        ),
      ),
    );
  }
}
