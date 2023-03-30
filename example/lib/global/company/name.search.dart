import 'package:flutter/material.dart';
import 'package:prembly/prembly.dart';

class NameSearchScreen extends StatelessWidget {
  NameSearchScreen({super.key});

  TextEditingController companyNameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Name Search'),
      ),
      body: Container(
        child: CompanyNameSearch(
          companyNameController: companyNameController,
          countryCodeController: countryCodeController,
        ),
      ),
    );
  }
}
