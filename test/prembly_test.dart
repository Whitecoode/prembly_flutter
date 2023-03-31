import 'package:flutter_test/flutter_test.dart';
import 'package:prembly_flutter/prembly_flutter.dart';

void main() {
  test('adds one to input values', () {
    PremblyPlugin premblyPlugin = PremblyPlugin.initialize(
      appId: "e307f0f8-2c97-4b2e-b89f-88e220cfe82b",
      apiKey: "test_ucc8c5fyl6rl78idn3lqjp:ogINip3R6hrzzARkTI42vv13ybY",
    );
    expect(premblyPlugin.sdkInitialized, true);
  });
}
