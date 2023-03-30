import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class RwandaBase {
  // National ID verification
  Future<void> verifyNationalID({
    required String number,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/rwanda/nid");
    try {
      var response = await http.post(
        url,
        body: json.encode({'number': number}),
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

  // Passport verification
  Future<void> verifyPassport({
    required String number,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/rwanda/passport");
    try {
      var response = await http.post(
        url,
        body: json.encode({'number': number}),
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
