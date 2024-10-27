import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String _message = 'Hi Reregulus🐣';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: _message,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
