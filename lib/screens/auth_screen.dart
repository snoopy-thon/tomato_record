import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const Center(
            child: Text('Auth screen!'),
          ),
          Container(
            color: Colors.accents[2],
          ),
          Container(
            color: Colors.accents[5],
          ),
        ],
      ),
    );
  }
}
