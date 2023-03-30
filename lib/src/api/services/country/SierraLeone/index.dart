import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class SierraLeoneBase {
  // Voters Card verification
  Future<void> verifyVotersCard({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/sl/voters");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'search_mode': payload["firstName"],
          'firstname': payload['firstName'],
          'lastname': payload["lastName"],
          'middlename': payload["middleName"],
          'number': payload["number"],
          'dob': payload["dateOfBirth"],
        }),
        headers: {
          "accept": 'application/json',
          'content-type': 'application/json',
          'x-api-key': apiKey,
          'app-id': appId,
        },
      );
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
