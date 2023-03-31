import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/config.dart';

class OtherNigeriaBaseVerification {
  // stampDuty verification
  Future<void> stampDutyVerifier({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/stamp_duty");
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

  // ninSlip verification
  Future<void> ninSlipVerifier({
    required String ninImageString,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/nin/image");
    try {
      var response = await http.post(
        url,
        body: json.encode({'image': ninImageString}),
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

  // virtualNiN verification
  Future<void> virtualNiNVerifier({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/nin_wo_face");
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

  // ninWithFace verification
  Future<void> ninWithFaceVerifier({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/nin");
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

  // Tax Identification Number verification
  Future<void> tinVerifier({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/tin");
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

  // Basic CAC verification
  Future<void> basicCACVerifier({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/cac");
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

  // Basic CAC Using Name verification
  Future<void> cacWithNameVerifier({
    required String companyName,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/cac_w_name");
    try {
      var response = await http.post(
        url,
        body: json.encode({'company_name': companyName}),
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

  // Advance CAC verification
  Future<void> advanceCacVerifier({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/cac/advance");
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
