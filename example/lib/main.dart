import 'package:flutter/material.dart';
import 'package:prembly/prembly.dart';


void main() {
  // Initializing prembly plugin
  PremblyPlugin.initialize(
    appId: "e307f0f8-2c97-4b2e-b89f-88e220cfe82b",
    apiKey: "test_ucc8c5fyl6rl78idn3lqjp:ogINip3R6hrzzARkTI42vv13ybY",
  ).then((_) {
    return runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prembly Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // home: RegisteredNumberScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Field controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _bvnNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prembly Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Email textfield
            EmailField(
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            // Plate number
            PlateNumberField(
              controller: _plateNumberController,
            ),
            const SizedBox(height: 20),
            // Phone Number
            PhoneNumberField(
              controller: _phoneNumberController,
            ),
            const SizedBox(height: 20),
            // Bvn number
            BvnNumberField(
              controller: _bvnNumberController,
            ),
          ],
        ),
      ),
    );
  }
}
