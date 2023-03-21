import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nirvada_user/app/data/base_api.dart';

class LoginFuntion {
  static Future<Map<String, dynamic>> loginUser(
      String voterIdNumber, String mobileNumber) async {
    try {
      Uri uri = Uri.parse(BaseUrl.url + "/user/login");

      Map<String, String> body = {
        "voter_id_number": voterIdNumber,
        "mobile_number": mobileNumber,
      };

      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      Map<String, dynamic> data = json.decode(response.body);

      // String voterId = data['data']['voter_id_number'];

      print(response.statusCode);
      print(response.body);
      return data;
    } catch (e) {
      print(e);
      return {};
    }
  }
}
