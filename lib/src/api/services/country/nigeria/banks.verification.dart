import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class NigeriaBanks {
  // Get Banks
  Future<void> getNigeriaBanks({
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/bank_code");
    try {
      var response = await http.get(
        url,
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

  // account Number verification
  Future<void> accountNumberVerifier({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/bank_account");
    try {
      var response = await http.post(
        url,
        body: json.encode(payload),
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
