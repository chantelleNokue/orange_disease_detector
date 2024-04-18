
import 'dart:io';
import 'package:http/http.dart' as http;

class LeafDetectionService {
  Future<String> sendImageToAPI(File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://your-flask-api-url.com/disease-detection'));
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception('Failed to upload image');
    }
  }

  Future<String> sendImage(File selectedImage) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:5080/detect'));
    request.files.add(await http.MultipartFile.fromPath('image', '/home/vincent/Desktop/mobile projects/apple disease detector/fruit disease/testing images/diseased/1.jpeg'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('Chantelle: Successfully send to the database');
      print('Status Code: ${response.statusCode}');
      return await response.stream.bytesToString();
    }
    else {
      print(response.reasonPhrase);
      return 'Failed';
    }

  }

}


//affold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 600,
//                       padding: const EdgeInsets.all(12.0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade50,
//                               spreadRadius: 1,
//                               blurRadius: 1,
//                               offset: const Offset(-1, -1),
//                             ),
//                             const BoxShadow(
//                               color: Colors.black12,
//                               spreadRadius: 1,
//                               blurRadius: 1,
//                               offset: Offset(1, 1),
//                             ),
//                           ]),
//                       child: Column(
//                         children: [
//                           // FadeInSlide(
//                           //     duration: 1.0,
//                           //     child: CircleAvatar(
//                           //       backgroundColor: Colors.transparent,
//                           //       radius: 40,
//                           //       child: Image.asset(Assets.eezimedzLogo),
//                           //     )),
//                           Row(
//                             children: [
//                               Text(
//                                 'RESULT',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 10,
//                                     color: Pallete.primaryColor),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     result,
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 10, color: Colors.grey),
//                                   ),
//                                   Text(
//                                     result,
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.grey.shade800),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//
//
//
//                           Row(
//                             children: [
//                               Text(
//                                 'RECOMANDATIONS',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 10,
//                                     color: Pallete.primaryColor),
//                               ),
//                             ],
//                           ),
//
//
//                           Container(
//                             width: 400,
// height: 200,
// color: Colors.blue,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//
//
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         reccomandation,
//                                         style: GoogleFonts.poppins(
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.grey.shade800),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                           ),
//                             ],
//
//
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//
//
//
//
//           Text(result),
//           Text(reccomandation),
//         ],
//       ),
//     )