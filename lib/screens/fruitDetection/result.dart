import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../customeAnimations/fade_in_slide.dart';
import '../../utils/asset_utils/assets_util.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String reccomandation;

  const ResultPage(
      {super.key, required this.result, required this.reccomandation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInSlide(
                duration: 1.0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 200,
                  child: Image.asset(Assets.eezimedzLogo),
                )),

            Row(
              children: [
                Text(
                  'DIAGNOSIS',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Pallete.onePrimaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  result,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
              ],
            ),

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
                  'RECOMANDATIONS',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Pallete.onePrimaryColor),
                ),
              ],
            ),

            Text(
              reccomandation,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800),
            ),

            const SizedBox(
              height: 16,
            ),

            // Text(result),
            // Text(reccomandation),
          ],
        ),
      ),
    );
  }
}
