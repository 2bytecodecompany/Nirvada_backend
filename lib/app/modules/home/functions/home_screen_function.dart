import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nirvada_user/app/data/base_api.dart';
import 'package:nirvada_user/app/models/CandidateModel.dart';

class HomeFuntion {
  static Future<List<CandidateModel>> candidateDetails() async {
    try {
      Uri uri = Uri.parse(BaseUrl.url + "candidate_details/get_all_candidates");

      final response = await http.post(uri,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"booth": "haryana/gurgaon"}));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final List<dynamic> responseBody = decoded['data'];
        print(responseBody);
        return responseBody.map((e) => CandidateModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
