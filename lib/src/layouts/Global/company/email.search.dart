import 'package:flutter/material.dart';

import '../../../widgets/CoodeInput.dart';

class CompanyEmailSearch extends StatelessWidget {
  const CompanyEmailSearch({
    required this.controller,
    this.hintText = "Company Email",
    this.hintStyle,
    this.borderDecoration,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final OutlineInputBorder? borderDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          CoodeInput(
            controller: controller,
            hintText: hintText,
            hintStyle: hintStyle,
            onSubmit: () {},
            borderDecoration: borderDecoration,
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
