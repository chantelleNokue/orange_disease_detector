// import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors.dart';
import 'package:http/http.dart' as http;

import 'resultLeafDetection.dart';


class HomePageLeaf extends StatefulWidget {
  const HomePageLeaf({super.key});

  @override
  State<HomePageLeaf> createState() => _HomePageLeafState();
}

class _HomePageLeafState extends State<HomePageLeaf> {

  // void _showSuccessDialog(String title, String content) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.success,
  //     animType: AnimType.rightSlide,
  //     title: title,
  //     desc: content,
  //     btnOkText: 'Got it',
  //     btnOkColor: Pallete.onePrimaryColor,
  //     btnOkOnPress: () {},
  //   ).show();
  // }

  File? _selectedImage;
  String diseaseName = '';
  String diseasePrecautions = '';
  bool detecting = false;
  bool precautionLoading = false;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
    await ImagePicker().pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }



  Future<Map?>sendImage(File selectedImage) async {
    setState(() {
      detecting = true;
    });


    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.100.14:5082/detect'),
    );

    request.headers['Content-Type'] = 'multipart/form-data'; // Set the content type header

    request.files.add(await http.MultipartFile.fromPath('image', selectedImage.path));

    var response = await http.Response.fromStream(await request.send());
    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Successfully sent to the database');
      print('Status Code: ${response.statusCode}');
       var jsonResponse = jsonDecode(response.body);
       return jsonResponse;
    } else {
      print(response.reasonPhrase);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30,),
          Stack(
            children: [

              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    // Top right corner
                    bottomLeft: Radius.circular(50.0), // Bottom right corner
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      // Extend the shadow to all sides equally
                      blurRadius: 5,
                      // Soften the shadow
                      offset: const Offset(2, 2), // Position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.onePrimaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'OPEN GALLERY',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.onePrimaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('CAMERA',
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 10),
                          Icon(Icons.camera_alt, color: Colors.white)
                        ],
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),

          _selectedImage == null
              ? Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child:  Center(
              child: Text(
                'Please select image for  detection',
                textAlign: TextAlign.center,
                style: TextStyle(color: Pallete.onePrimaryColor, fontSize: 16, fontWeight: FontWeight.w500),
                // style: GoogleFonts.poppins(
                //     color: Pallete.primaryColor,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w500
                // )
              ),
            ),
          )
              : Expanded(
            child: Container(
              width: double.infinity,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),


          if (_selectedImage != null)
            detecting
                ? SpinKitWave(
              color: Pallete.onePrimaryColor,
              size: 30,
            )
                : Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.onePrimaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                  // Set some horizontal and vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                onPressed: () async {
                  final response = await sendImage(_selectedImage!);
                  print('API Response: $response');
                  String reco = response!['recommendation'] ?? '';
                  String res = response!['result'] ?? '';
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(reccomandation: reco, result: res),));
                },
                child: const Text(
                  'DETECT',
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                    fontSize: 16, // Set the font size
                    fontWeight:
                    FontWeight.bold, // Set the font weight to bold
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
