// ignore_for_file: non_constant_identifier_names
import 'dart:async';

import 'package:flutter/material.dart';
import './verifier.dart';

class PremblyPlugin {
  static bool _sdkInitialized = false;
  static String _apiKey = "";
  static String _appId = "";

  // Initializing the prembly object with the appID and the apiKey that are required for API
  static initialize({required String appId, required String apiKey}) async {
    assert(() {
      if (apiKey.isEmpty) {
        throw Exception('x-api-Key cannot be null or empty');
      }
      if (appId.isEmpty) {
        throw Exception('app-id cannot be null or empty');
      }
      return true;
    }());
    if (_sdkInitialized) return;
    try {
      _sdkInitialized = true;
      _apiKey = apiKey;
      _appId = appId;
    } catch (e) {
      print(e);
    }
  }

  // getting sdkInitializer value
  bool get sdkInitialized => _sdkInitialized;

  String get api_key {
    // validating sdkInitializer is initialized
    _validateSdkInitialized();
    return _apiKey;
  }

  String get app_id {
    // validating sdkInitializer is initialized
    _validateSdkInitialized();
    return _appId;
  }

  _print() {
    if (sdkInitialized) {
      print({sdkInitialized, app_id, api_key});
    }
  }

  // disposing and resetting to default value;
  // dispose() {
  //   _sdkInitialized = false;
  //   _apiKey = '';
  //   _appId = '';
  // }

  // checking performance
  void _performance() {
    _print();
    // Validate SDK that have been initialize
    _validateSdkInitialized();

    // checking for null and empty value
    if (_apiKey.isEmpty || _appId.isEmpty) {
      throw Exception(
          "Prembly_flutter not initialized, required your api-key and app-id.");
    }
    if (_appId.length < 30 || !_appId.contains('-')) {
      throw Exception("Prembly_flutter appID is too short and Invalid.");
    }
    if (_apiKey.length < 40 || !_apiKey.startsWith('test_')) {
      throw Exception("Prembly_flutter apiKey is too short and Invalid.");
    }
  }

  // initialize validator
  _validateSdkInitialized() {
    if (!sdkInitialized) {
      throw Exception('Prembly SDK has not been initialized. The SDK has'
          ' to be initialized before use');
    }
  }

  // AlertBox
  void messenger(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('An Error Occur'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

// Global
  // email address verifier
  Future<dynamic> emailVerifier(String email) async {
    _performance();
    return Verifier(
      apiKey: api_key,
      appID: app_id,
    ).emailVerifier(email);
  }

  // Company
  // company name search
  Future<dynamic> companyNameSearch(dynamic payload) async {
    _performance();
    return Verifier(
      apiKey: api_key,
      appID: app_id,
    ).companyNameSearch(payload);
  }

  // companyRegisteredNumberSearch
  Future<dynamic> companyRegisteredNumberSearch(dynamic payload) async {
    _performance();
    return Verifier(
      apiKey: api_key,
      appID: app_id,
    ).companyRegisteredNumberSearch(payload);
  }

// Country
  // Plate number verifier
  Future<dynamic> ngPlateNumberVerifier(String plateNumber) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).plateNumberVerifier(plateNumber);
  }

  // phone number verifier
  Future<dynamic> ngPhoneNumberVerifier(String phoneNumber) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).phoneNumberVerifier(phoneNumber);
  }

  // bvn number verifier
  Future<dynamic> ngBvnNumberVerifier(String bvnNumber) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).bvnNumberVerifier(bvnNumber);
  }

  // stampDuty verifier
  Future<dynamic> ngStampDutyVerifier({
    required String number,
    required String customerName,
    required String customerReference,
  }) async {
    Map<String, dynamic> payload = {
      'number': number,
      'customer_name': customerName,
      'customerReference': customerReference,
    };
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).stampDutyVerifier(payload);
  }

  // stampDuty verifier
  Future<dynamic> ngNinSlipVerifier({
    required String ninImageString,
  }) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ninSlipVerifier(ninImageString);
  }

  // Virtual NIN verifier
  Future<dynamic> ngVirtualNiNVerifier({
    required String number,
    required String numberNin,
  }) async {
    Map<String, dynamic> payload = {
      'number': number,
      'number_nin': numberNin,
    };
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).virtualNiNVerifier(payload);
  }

  // nin With Face verifier
  Future<dynamic> ngNinWithFaceVerifier({
    required String image,
    required String number,
  }) async {
    Map<String, dynamic> payload = {
      'image': image,
      'number': number,
    };
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ninWithFaceVerifier(payload);
  }

  // basic CAC verifier
  Future<dynamic> ngBasicCACVerifier({
    required String companyName,
    required num rcNumber,
  }) async {
    Map<String, dynamic> payload = {
      'rc_number': rcNumber,
      'company_name': companyName,
    };
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).basicCACVerifier(payload);
  }

  // cac With Name verifier
  Future<dynamic> ngCacWithNameVerifier({
    required String companyName,
  }) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).cacWithNameVerifier(companyName);
  }

  // cac With Name verifier
  Future<dynamic> ngAdvanceCacVerifier({
    required String companyName,
    required num rcNumber,
    required String companyType,
  }) async {
    Map<String, dynamic> payload = {
      'rc_number': rcNumber,
      'company_name': companyName,
      'company_type': companyType,
    };
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).advanceCacVerifier(payload);
  }

  // Banks verification
  // Get banks
  Future<dynamic> getNigeriaBanks() async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).getBanks();
  }

  // cac With Name verifier
  Future<dynamic> ngAccountNumberVerifier({
    required num number,
    required num bankCode,
  }) async {
    Map<String, dynamic> payload = {
      'number': number,
      'bank_code': bankCode,
    };
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).accountNumberVerifier(payload);
  }

  // Ghana
  // Driver License verifier
  Future<dynamic> ghDriverLicenseVerifier({
    required String number,
    required String dateOfBirth,
  }) async {
    Map<String, dynamic> payload = {
      'number': number,
      'bank_code': dateOfBirth,
    };
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ghDriverLicenseVerifier(payload);
  }

  // International Passport verifier
  Future<dynamic> ghVerifyInternationalPassport({
    required String number,
  }) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ghVerifyInternationalPassport(number);
  }

  // SSNIT verifier
  Future<dynamic> ghVerifySSNIT({
    required String number,
  }) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ghVerifySSNIT(number);
  }

  // SSNIT with face verifier
  Future<dynamic> ghVerifySSNITWithFace({
    required String number,
    required String faceImage,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'number': number,
      'faceImage': faceImage,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ghVerifySSNITWIthFace(payload);
  }

  // Voters verifier
  Future<dynamic> ghVerifyVoters({
    required String type,
    required String number,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'number': number,
      'type': type,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ghVerifyVoters(payload);
  }

  // Kenya verification
  // Alien Id verifier
  Future<dynamic> kyVerifyAlienID({
    required String customerName,
    required String number,
    required String customerReference,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'number': number,
      'customerName': customerName,
      'customerReference': customerReference,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).kyVerifyAlienID(payload);
  }

  // Driver license verifier
  Future<dynamic> kyVerifyDriversLicense({
    required String customerName,
    required String number,
    required String customerReference,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'number': number,
      'customerName': customerName,
      'customerReference': customerReference,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).kyVerifyDriversLicense(payload);
  }

  // International Passport verifier
  Future<dynamic> kyVerifyInternationalPassport({
    required String customerName,
    required String number,
    required String customerReference,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'number': number,
      'customerName': customerName,
      'customerReference': customerReference,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).kyVerifyInternationalPassport(payload);
  }

  // National Identity Number verifier
  Future<dynamic> kyVerifyNationalIdentityNumber({
    required String customerName,
    required String number,
    required String customerReference,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'number': number,
      'customerName': customerName,
      'customerReference': customerReference,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).kyVerifyNationalIdentityNumber(payload);
  }

  // Rwanda
  // National ID Verifier
  Future<dynamic> rwVerifyNationalID({
    required String number,
  }) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).rwVerifyNationalID(number);
  }

  // Verify Passport
  Future<dynamic> rwVerifyPassport({
    required String number,
  }) async {
    _performance();
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).rwVerifyPassport(number);
  }

  // Sierra Leone
  // Voters Card
  Future<dynamic> slVerifyVotersCard({
    required String searchMode,
    required String firstName,
    required String lastName,
    required String middleName,
    required String dateOfBirth,
    required String number,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'number': number,
      'searchMode': searchMode,
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'dateOfBirth': dateOfBirth,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).slVerifyVotersCard(payload);
  }

  // South Africa
  // Business Verification
  Future<dynamic> saVerifyBusinessVerification({
    required String customerName,
    required String regNumber,
    required String customerReference,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'customerName': customerName,
      'regNumber': regNumber,
      'customerReference': customerReference,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).saVerifyBusinessVerification(payload);
  }

  // National Identity
  Future<dynamic> saVerifyNationalIdentity({
    required String firstName,
    required String lastName,
    required String nationalID,
    required String dateOfBirth,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'firstName': firstName,
      'lastName': lastName,
      'nationalID': nationalID,
      'dateOfBirth': dateOfBirth,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).saVerifyNationalIdentity(payload);
  }

  // Uganda
  // Business Verification
  Future<dynamic> ugVerifyBusinessVerification({
    required String customerReference,
    required String customerName,
    required String reservationNumber,
  }) async {
    _performance();
    Map<String, dynamic> payload = {
      'customerName': customerName,
      'reservationNumber': reservationNumber,
      'customerReference': customerReference,
    };
    return Verifier(
      appID: app_id,
      apiKey: api_key,
    ).ugVerifyBusinessVerification(payload);
  }
}
