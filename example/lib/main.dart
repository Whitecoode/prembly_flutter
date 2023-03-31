import 'package:flutter/material.dart';
import 'package:prembly_flutter/prembly_flutter.dart';

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
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Instance of PremblyPlugin
  PremblyPlugin premblyPlugin = PremblyPlugin();

  // Loading state controller
  bool loading = false;

  // Field controllers
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _plateNumberController = TextEditingController();

  final TextEditingController _bvnNumberController = TextEditingController();

  final TextEditingController _internationalPassportController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prembly Flutter Example'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Email verification
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
                hintText: "Verify Email",
                suffixIcon: InkWell(
                  onTap: loading
                      ? null
                      : () async {
                          setState(() => loading = true);
                          var response = await premblyPlugin
                              .emailVerifier(_emailController.text);
                          print(response);

                          setState(() => loading = false);
                        }, //Email verifier handler
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : const Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),

            // Country
            // Nigeria
            // Plate Number verification
            TextFormField(
              controller: _plateNumberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
                hintText: "Verify Plate Number",
                suffixIcon: InkWell(
                  onTap: loading
                      ? null
                      : () async {
                          setState(() => loading = true);
                          var response =
                              await premblyPlugin.ngPlateNumberVerifier(
                                  _plateNumberController.text);
                          print(response);

                          setState(() => loading = false);
                        }, //Plate Number verifier handler
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : const Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
            // Bank verification Number verification
            TextFormField(
              controller: _plateNumberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
                hintText: "Verify BVN Number",
                suffixIcon: InkWell(
                  onTap: loading
                      ? null
                      : () async {
                          setState(() => loading = true);
                          var response = await premblyPlugin
                              .ngBvnNumberVerifier(_bvnNumberController.text);
                          print(response);

                          setState(() => loading = false);
                        }, //BVN verifier handler
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : const Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
            // Ghana
            // International Passport verification
            TextFormField(
              controller: _plateNumberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
                hintText: "Verify International Passport Number",
                suffixIcon: InkWell(
                  onTap: loading
                      ? null
                      : () async {
                          setState(() => loading = true);
                          var response =
                              await premblyPlugin.ghVerifyInternationalPassport(
                                  number:
                                      _internationalPassportController.text);
                          print(response);

                          setState(() => loading = false);
                        }, //BVN verifier handler
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : const Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
