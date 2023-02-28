class PremblyPlugin {
  bool _SDKInitialized = false;
  String _apiKey = '';
  String _appId = '';

  // Initalizing the prembly object with the appID and the apiKey that are required for API
  Initialize({required String appID, required String apiKey}) {
    if (appID == null || apiKey == '' || appID == '' || apiKey == null) {
      throw Exception("Prembly_flutter not initailzed.");
    }
    if (appID.length < 30 && !appID.contains('-')) {
      throw Exception("Prembly_flutter appID is too short and Invalid.");
    }
    if (apiKey.length < 40 && !apiKey.contains('_')) {
      throw Exception("Prembly_flutter apiKey is too short and Invalid.");
    }
    if (_SDKInitialized) return;
    _appId = appID;
    _apiKey = apiKey;
  }

// disposing and reseting to default value;
  dispose() {
    _SDKInitialized = false;
    _apiKey = '';
    _appId = '';
  }

// getting sdkInitializer value
  bool get sdkInitialized => _SDKInitialized;

  String get apiKey {
    _validateSdkInitialized();
    return _apiKey;
  }

  String get appId {
    _validateSdkInitialized();
    return _appId;
  }

  _validateSdkInitialized() {
    if (!sdkInitialized) {
      throw Exception('Prembly SDK has not been initialized. The SDK has'
          ' to be initialized before use');
    }
  }
}
