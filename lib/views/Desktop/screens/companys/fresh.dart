import 'package:flutter/material.dart';

class FreshScreen extends StatelessWidget {
  const FreshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Fresh',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
