import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class SouthAfricaBase {
  // National Identity verification
  Future<void> verifyNationalIdentity({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/sa/national_id");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'firstname': payload["firstName"],
          'lastname': payload["lastName"],
          'nationalid': payload["nationalID"],
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

  // Business Verification verification
  Future<void> verifyBusinessVerification({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/sa/company");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'customer_name': payload["customerName"],
          'reg_number': payload["regNumber"],
          'customer_reference': payload["customerReference"],
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
