import 'package:flutter/material.dart';

import '../../common/prembly.plugin.dart';
import '../../widgets/CoodeInput.dart';

class PlateNumberField extends StatefulWidget {
  const PlateNumberField({
    required this.controller,
    // this.decoration =
    this.onChange,
    this.hintStyle,
    this.hintText = 'Enter Plate Number',
    this.borderDecoration,
    super.key,
  });

  final TextEditingController controller;
  final Function(String)? onChange;
  final TextStyle? hintStyle;
  final String hintText;
  final OutlineInputBorder? borderDecoration;

  @override
  State<PlateNumberField> createState() => _PlateNumberFieldState();
}

class _PlateNumberFieldState extends State<PlateNumberField> {
  // final InputDecoration? decoration;

  // form global state
  final GlobalKey<FormState> _formkey = GlobalKey();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SizedBox(
        width: double.infinity,
        child: CoodeInput(
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          controller: widget.controller,
          onChanged: widget.onChange,
          keyboardType: TextInputType.emailAddress,
          borderDecoration: widget.borderDecoration,
          loading: _loading,
          handlerText: 'Verify',
          onSubmit: () async {
            if (!_formkey.currentState!.validate()) return;
            setState(() {
              _loading = true;
            });
            try {
              await PremblyPlugin()
                  .ngPlateNumberVerifier(widget.controller.text);
            } catch (e) {
              PremblyPlugin().messenger(
                context,
                e.toString(),
              );
            }
            setState(() {
              _loading = false;
            });
          },
        ),
      ),
    );
  }
}
