import 'dart:convert';

import '../../../data/base_api.dart';
import 'package:http/http.dart' as http;

class VoteFunction {
  static Future<void> castVote(String voterId, String id) async {
    try {
      Uri uri = Uri.parse(BaseUrl.url + "/vote_casting/insert");

      Map<String, String> body = {
        "candidate_id": id,
        "voter_id_number": voterId,
      };

      final response = await http.post(uri,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode(body));

      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
