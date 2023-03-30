import 'package:flutter/material.dart';
import 'package:prembly/prembly.dart';

class RegisteredNumberScreen extends StatelessWidget {
  RegisteredNumberScreen({super.key});

  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyNumberController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Name Search'),
      ),
      body: Container(
        child: CompanyRegisteredNumberSearch(
          companyRegisterNumberController: companyNumberController,
          companyNameController: companyNameController,
          countryCodeController: countryCodeController,
        ),
      ),
    );
  }
}
