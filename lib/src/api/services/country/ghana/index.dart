import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class GhanaBase {
  // International Passport verification
  Future<void> verifyInternationalPassport({
    required String number,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/gh/passport");
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

  // Drivers License verification
  Future<void> verifyDriversLicense({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/gh/drivers_license");
    try {
      var response = await http.post(
        url,
        body: json.encode({
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

  // SSNIT verification
  Future<void> verifySSNIT({
    required String number,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/gh/ssnit");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'number': number,
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

  // SSNIT with Face verification
  Future<void> verifySSNITWIthFace({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/gh/ssnit/face");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'number': payload["number"],
          'image': payload["faceImage"],
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

  // Voters card verification
  Future<void> verifyVoters({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/gh/voters");
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'number': payload["number"],
          'type': payload["type"],
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
