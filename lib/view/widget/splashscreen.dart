import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/News_Flow_logo.png',
          width: 200, // adjust size if needed
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

