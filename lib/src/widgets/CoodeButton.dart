import 'package:flutter/material.dart';

class CoodeButton extends StatelessWidget {
  const CoodeButton({
    super.key,
    required this.onPressed,
    this.loading = false,
  });

  final Function() onPressed;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Opacity(
        opacity: loading ? 0.5 : 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: onPressed,
          child: loading
              ? const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : const Text('Proceed'),
        ),
      ),
    );
  }
}
