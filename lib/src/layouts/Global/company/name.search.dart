import 'package:flutter/material.dart';

import '../../../common/prembly.plugin.dart';
import '../../../widgets/CoodeButton.dart';
import '../../../widgets/CoodeInput.dart';

class CompanyNameSearch extends StatefulWidget {
  const CompanyNameSearch({
    required this.companyNameController,
    required this.countryCodeController,
    this.companyNameHintText = "Company Name",
    this.countryCodeHintText = "Country Code",
    this.hintStyle,
    this.borderDecoration,
    super.key,
  });

  final TextEditingController companyNameController;
  final TextEditingController countryCodeController;
  final String companyNameHintText;
  final String countryCodeHintText;
  final TextStyle? hintStyle;
  final OutlineInputBorder? borderDecoration;

  @override
  State<CompanyNameSearch> createState() => _CompanyNameSearchState();
}

class _CompanyNameSearchState extends State<CompanyNameSearch> {
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
            child: Container(
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
                await PremblyPlugin().companyNameSearch({
                  'country_code': widget.countryCodeController.text,
                  'company_name': widget.companyNameController.text,
                });
                setState(() {
                  _isloading = false;
                });
              },
              loading: _isloading,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Searched Results:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      resText(text: 'Status: '),
                      resText(text: 'reference: '),
                      resText(text: 'Name: '),
                      resText(text: 'Short Name: '),
                      resText(text: 'Brand Name: '),
                      resText(text: 'International Number: '),
                      resText(text: 'Country: '),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container resText({required String text}) {
    return Container(
      child: Column(
        children: [
          Text(text),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
