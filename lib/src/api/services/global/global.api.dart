import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../config/config.dart';

class GlobalVerification {
  // email verification
  Future<void> verifyEmail({
    required String email,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/emailage");
    try {
      var response = await http.post(
        url,
        body: json.encode({'email': email}),
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

  // company verification
  // company name search
  Future<void> companyNameSearch({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/global/company/search");
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

  // company register number search
  Future<void> companyRegisteredNumberSearch({
    required dynamic payload,
    required String apiKey,
    required String appId,
  }) async {
    var url = Uri.parse("${Config.base_url}/global/company");
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
