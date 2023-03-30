import 'package:prembly/src/api/api_endpoints.dart';

class Verifier {
  Verifier({required this.appID, required this.apiKey});
  String appID;
  String apiKey;

  // Global
  // Email verification [Email]
  Future<dynamic> emailVerifier(String email) async {
    try {
      await GlobalVerification()
          .verifyEmail(email: email, apiKey: apiKey, appId: appID)
          .then((value) => value);
    } catch (e) {
      rethrow;
    }
  }

  // Company
  // Company name search
  Future<dynamic> companyNameSearch(dynamic payload) async {
    try {
      await GlobalVerification()
          .companyNameSearch(payload: payload, apiKey: apiKey, appId: appID)
          .then((value) => value);
    } catch (e) {
      rethrow;
    }
  }

  // companyRegisteredNumberSearch
  Future<dynamic> companyRegisteredNumberSearch(dynamic payload) async {
    try {
      await GlobalVerification()
          .companyNameSearch(payload: payload, apiKey: apiKey, appId: appID)
          .then((value) => value);
    } catch (e) {
      rethrow;
    }
  }

  // Country
  // Nigeria
  // Plate number verification [PlateNumber]
  Future<dynamic> plateNumberVerifier(String plateNumber) async {
    try {
      await NigeriaNumberBaseVerification()
          .verifyPlateNumber(
            plateNumber: plateNumber,
            apiKey: apiKey,
            appId: appID,
          )
          .then((value) => value);
    } catch (e) {
      rethrow;
    }
  }

  // Phone number verification [PhoneNumber]
  Future<dynamic> bvnNumberVerifier(String plateNumber) async {
    try {
      var response = await NigeriaNumberBaseVerification().verifyBvnNumber(
        bvnNumber: plateNumber,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Phone number verification [PhoneNumber]
  Future<dynamic> phoneNumberVerifier(String plateNumber) async {
    try {
      var response = await NigeriaNumberBaseVerification().verifyPhoneNumber(
        phoneNumber: plateNumber,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Stamp Duty
  Future<dynamic> stampDutyVerifier(dynamic payload) async {
    try {
      var response = await OtherNigeriaBaseVerification().stampDutyVerifier(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Nin Slip Verifier
  Future<dynamic> ninSlipVerifier(String ninImageString) async {
    try {
      var response = await OtherNigeriaBaseVerification().ninSlipVerifier(
        ninImageString: ninImageString,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Virtual Nin Slip Verifier
  Future<dynamic> virtualNiNVerifier(dynamic payload) async {
    try {
      var response = await OtherNigeriaBaseVerification().virtualNiNVerifier(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Nin With Face Verifier
  Future<dynamic> ninWithFaceVerifier(dynamic payload) async {
    try {
      var response = await OtherNigeriaBaseVerification().ninWithFaceVerifier(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // basic CAC Verifier
  Future<dynamic> basicCACVerifier(dynamic payload) async {
    try {
      var response = await OtherNigeriaBaseVerification().basicCACVerifier(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // basic CAC using Name Verifier
  Future<dynamic> cacWithNameVerifier(String companyName) async {
    try {
      await OtherNigeriaBaseVerification()
          .cacWithNameVerifier(
            companyName: companyName,
            apiKey: apiKey,
            appId: appID,
          )
          .then((value) => value);
    } catch (e) {
      rethrow;
    }
  }

  // advance CAC Verifier
  Future<dynamic> advanceCacVerifier(dynamic payload) async {
    try {
      var response = await OtherNigeriaBaseVerification().advanceCacVerifier(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Nigeria Banks
  // get Banks
  Future<dynamic> getBanks() async {
    try {
      var response = await NigeriaBanks().getNigeriaBanks(
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // account Number Verifier
  Future<dynamic> accountNumberVerifier(dynamic payload) async {
    try {
      var response = await NigeriaBanks().accountNumberVerifier(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Ghana
  // Driver License Verifier
  Future<dynamic> ghDriverLicenseVerifier(dynamic payload) async {
    try {
      var response = await GhanaBase().verifyDriversLicense(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // International Passport Verifier
  Future<dynamic> ghVerifyInternationalPassport(String number) async {
    try {
      var response = await GhanaBase().verifyInternationalPassport(
        number: number,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // SSNIT Verifier
  Future<dynamic> ghVerifySSNIT(String number) async {
    try {
      var response = await GhanaBase().verifySSNIT(
        number: number,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // SSNIT with Face Verifier
  Future<dynamic> ghVerifySSNITWIthFace(dynamic payload) async {
    try {
      var response = await GhanaBase().verifySSNITWIthFace(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Voters Verifier
  Future<dynamic> ghVerifyVoters(dynamic payload) async {
    try {
      var response = await GhanaBase().verifyVoters(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Kenya
  // Alien Id Verifier
  Future<dynamic> kyVerifyAlienID(dynamic payload) async {
    try {
      var response = await KenyaBase().verifyAlienID(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Driver License Verifier
  Future<dynamic> kyVerifyDriversLicense(dynamic payload) async {
    try {
      var response = await KenyaBase().verifyDriversLicense(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // International Passport Verifier
  Future<dynamic> kyVerifyInternationalPassport(dynamic payload) async {
    try {
      var response = await KenyaBase().verifyInternationalPassport(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // National Identity Number Verifier
  Future<dynamic> kyVerifyNationalIdentityNumber(dynamic payload) async {
    try {
      var response = await KenyaBase().verifyNationalIdentityNumber(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Serial Number Verifier
  Future<dynamic> kyVerifySerialNumber(dynamic payload) async {
    try {
      var response = await KenyaBase().verifySerialNumber(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Rwanda
  // National ID Verifier
  Future<dynamic> rwVerifyNationalID(String number) async {
    try {
      var response = await RwandaBase().verifyNationalID(
        number: number,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Verify Passport
  Future<dynamic> rwVerifyPassport(String number) async {
    try {
      var response = await RwandaBase().verifyPassport(
        number: number,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Sierra Leone
  // Serial Number Verifier
  Future<dynamic> slVerifyVotersCard(dynamic payload) async {
    try {
      var response = await SierraLeoneBase().verifyVotersCard(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // South Africa
  // Business Verification
  Future<dynamic> saVerifyBusinessVerification(dynamic payload) async {
    try {
      var response = await SouthAfricaBase().verifyBusinessVerification(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // National Identity
  Future<dynamic> saVerifyNationalIdentity(dynamic payload) async {
    try {
      var response = await SouthAfricaBase().verifyNationalIdentity(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Uganda
  // Business Verification
  Future<dynamic> ugVerifyBusinessVerification(dynamic payload) async {
    try {
      var response = await UgandaBase().verifyBusinessVerification(
        payload: payload,
        apiKey: apiKey,
        appId: appID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
