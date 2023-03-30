import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class UgandaBase {
  // Business Verification verification
  Future<void> verifyBusinessVerification({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/ug/company");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'customer_reference': payload["customerReference"],
          'customer_name': payload["customerName"],
          'reservation_number': payload["reservationNumber"],
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
