import 'package:flutter/material.dart';

import '../prembly.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    PremblyPlugin().Initialize(apiKey: "", appID: "");

    return Container(
      child: TextFormField(),
    );
  }
}
