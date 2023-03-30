import 'package:flutter/material.dart';

class CoodeInput extends StatelessWidget {
  const CoodeInput({
    required this.controller,
    this.onChanged,
    required this.hintText,
    this.hintStyle,
    this.borderDecoration,
    this.loading = false,
    this.onSubmit,
    this.keyboardType = TextInputType.text,
    this.handlerText = '',
    super.key,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;
  final TextStyle? hintStyle;
  final OutlineInputBorder? borderDecoration;
  final bool loading;
  final Function()? onSubmit;
  final TextInputType? keyboardType;
  final String? handlerText;

  // Border style
  OutlineInputBorder _border(Color color) {
    OutlineInputBorder borderDecoration = const OutlineInputBorder();
    if (borderDecoration != const OutlineInputBorder()) {
      borderDecoration = borderDecoration;
    } else {
      borderDecoration = OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          width: 1,
          color: color,
        ),
      );
    }
    return borderDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) return '$hintText is required';
        return null;
      },
      style: const TextStyle(
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: hintStyle,
        border: _border(Colors.black54),
        errorBorder: _border(Colors.redAccent),
        enabledBorder: _border(Colors.black54),
        suffixIcon: handlerText!.isNotEmpty
            ? InkWell(
                onTap: loading ? null : onSubmit,
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
                        : Text(
                            handlerText.toString(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              )
            : const Text(''),
      ),
    );
  }
}
