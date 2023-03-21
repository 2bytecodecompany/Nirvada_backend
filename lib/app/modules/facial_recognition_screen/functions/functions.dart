import 'dart:convert';

import 'package:http/http.dart' as http;

class FacialRecognisitionFunction {
  static Future<String?> compareImages(String image1, String image2) async {
    try {
      Uri url = Uri.parse("https://api-us.faceplusplus.com/facepp/v3/compare");

      Map<String, dynamic> body = {
        "api_key": "kgpQs8Gbjtt2gMb60w9OQUGWPV_wTjR-",
        "api_secret": "gTfbB1Ttt7K9wX6EU_-ERB4b5Yt_GZeE",
        "image_base64_1": image1,
        "image_base64_2": image2,
        // "image_url1":
        //     "https://firebasestorage.googleapis.com/v0/b/chat-app-9ad44.appspot.com/o/divyanshu.jpg?alt=media&token=fd791c64-8009-42de-86c8-87e04c4be9b7",
        // "image_url2":
        //     "https://firebasestorage.googleapis.com/v0/b/chat-app-9ad44.appspot.com/o/Dv.jpg?alt=media&token=2b573103-e81f-41b7-a594-895064ab8651",
      };

      final response = await http.post(
        url,
        body: body,
      );

      print(response.body);

      final encoded = json.decode(response.body);

      return encoded['confidence'].toString();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
