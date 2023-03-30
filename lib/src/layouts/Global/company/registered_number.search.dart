import 'package:flutter/material.dart';

import '../../../common/prembly.plugin.dart';
import '../../../widgets/CoodeButton.dart';
import '../../../widgets/CoodeInput.dart';

class CompanyRegisteredNumberSearch extends StatefulWidget {
  const CompanyRegisteredNumberSearch({
    required this.companyNameController,
    required this.countryCodeController,
    required this.companyRegisterNumberController,
    this.companyNameHintText = "Company Name",
    this.countryCodeHintText = "Country Code",
    this.companyRegisterNumberHintText = "Company Register Number",
    this.hintStyle,
    this.borderDecoration,
    super.key,
  });

  final TextEditingController companyNameController;
  final TextEditingController countryCodeController;
  final TextEditingController companyRegisterNumberController;
  final String companyNameHintText;
  final String countryCodeHintText;
  final String companyRegisterNumberHintText;
  final TextStyle? hintStyle;
  final OutlineInputBorder? borderDecoration;

  @override
  State<CompanyRegisteredNumberSearch> createState() =>
      _CompanyRegisteredNumberSearchState();
}

class _CompanyRegisteredNumberSearchState
    extends State<CompanyRegisteredNumberSearch> {
  bool _isloading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CoodeInput(
                  controller: widget.companyRegisterNumberController,
                  hintText: widget.companyRegisterNumberHintText,
                  hintStyle: widget.hintStyle,
                  borderDecoration: widget.borderDecoration,
                ),
                const SizedBox(height: 5),
                Container(
                  // height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: CoodeInput(
                          controller: widget.companyNameController,
                          hintText: widget.companyNameHintText,
                          hintStyle: widget.hintStyle,
                          borderDecoration: widget.borderDecoration,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CoodeInput(
                          controller: widget.countryCodeController,
                          hintText: widget.countryCodeHintText,
                          hintStyle: widget.hintStyle,
                          borderDecoration: widget.borderDecoration,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerRight,
            child: CoodeButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;
                setState(() {
                  _isloading = true;
                });
                await PremblyPlugin().companyRegisteredNumberSearch({
                  'country_code': widget.countryCodeController.text,
                  'company_name': widget.companyNameController.text,
                  'company_number': widget.companyRegisterNumberController.text,
                });
                setState(() {
                  _isloading = false;
                });
              },
              loading: _isloading,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search Results:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 2.0,
                        offset: Offset(0, 0),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Name:'),
                        SizedBox(height: 4),
                        Text('International Number:'),
                        SizedBox(height: 4),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Brand-Name:'),
                        SizedBox(height: 4),
                        Text('Country Code:'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
