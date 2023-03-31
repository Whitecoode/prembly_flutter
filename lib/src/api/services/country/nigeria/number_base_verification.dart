import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class NigeriaNumberBaseVerification {
  // Plate number verification
  Future<void> verifyPlateNumber({
    required String plateNumber,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/vehicle");
    try {
      var response = await http.post(
        url,
        body: json.encode({'vehicle_number': plateNumber}),
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

  // BVN number verification
  Future<void> verifyBvnNumber(
      {required String bvnNumber,
      required String apiKey,
      required String appId}) async {
    var url = Uri.parse("${Config.base_url}/bvn");
    try {
      var response = await http.post(
        url,
        body: json.encode({'number': bvnNumber}),
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

  // Phone number verification
  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
      required String apiKey,
      required String appId}) async {
    var url = Uri.parse("${Config.base_url}/phone_number");
    try {
      var response = await http.post(
        url,
        body: json.encode({'number': phoneNumber}),
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
