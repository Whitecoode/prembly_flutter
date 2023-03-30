import 'package:flutter/material.dart';
import 'package:prembly/prembly.dart';

class EmailSearchScreen extends StatelessWidget {
  EmailSearchScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Email Search'),
      ),
      body: Container(child: CompanyEmailSearch(controller: controller)),
    );
  }
}
