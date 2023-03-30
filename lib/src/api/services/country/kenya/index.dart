import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class KenyaBase {
  // National Identity Number verification
  Future<void> verifyNationalIdentityNumber({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/ke/national_id/new");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'customer_name': payload["customerName"],
          'number': payload["number"],
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

  // International Passport verification
  Future<void> verifyInternationalPassport({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/ke/passport");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'customer_name': payload["customerName"],
          'number': payload["number"],
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

  // Drivers License verification
  Future<void> verifyDriversLicense({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/ke/drivers_license");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'customer_name': payload["customerName"],
          'number': payload["number"],
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

  // Alien ID verification
  Future<void> verifyAlienID({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/ke/alien_id");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'customer_name': payload["customerName"],
          'number': payload["number"],
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

  // Serial Number verification
  Future<void> verifySerialNumber({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/ke/serial_number");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'customer_name': payload["customerName"],
          'number': payload["number"],
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
