import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nirvada_user/app/data/base_api.dart';

class RegisterFuntions {
  static Future<Map<String, dynamic>> registerUser(
      String voterIdNumber, String mobileNumber) async {
    try {
      Uri uri = Uri.parse(BaseUrl.url + "user/signup");

      Map<String, String> body = {
        "voter_id_number": voterIdNumber,
        "mobile_number": "+91" + mobileNumber,
      };

      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      print(response.body);
      Map<String, dynamic> data = json.decode(response.body);

      // String voterId = data['data']['voter_id_number'];

      return data;
    } catch (e) {
      print(e);
      return {};
    }
  }
}
