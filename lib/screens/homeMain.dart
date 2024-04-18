
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              opacity: 0.4,
              alignment: Alignment.topCenter,
              image: AssetImage(
                  Assets.eezimedzLogo
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
              child: Text(
                  'Welcome to Orange Disease Detection\nwhere you can detect a disease with a single click',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Pallete.onePrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          height: 320,
          child: Column(
            children: [
              Text(
                  "What do you wanna do ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Pallete.onePrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  )
              ),

              Text(
                  "Please choose how you'd like to use our app",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Pallete.onePrimaryColor,
                    fontSize: 12,
                  )
              ),

              SizedBox(
                height: 140,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: roleWidget(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePageLeaf())),
                            color:   Pallete.onePrimaryColor,
                            textIconColour:  Colors.white ,
                            center: "Detect",
                            bottom: "Leaf",
                            icon: Icons.library_books
                        ),
                      ),

                      SizedBox(
                        width: 8,
                      ),

                      Expanded(
                        child: roleWidget(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePage())),
                            color:   Pallete.onePrimaryColor,
                            textIconColour:  Colors.white ,
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
    );

  }

  Widget roleWidget({required Color color, required Color textIconColour, required void Function() onTap, required String center, required IconData icon, required String bottom}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
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
