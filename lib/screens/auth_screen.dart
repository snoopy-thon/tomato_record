import 'package:flutter/material.dart';
import 'package:tomato_record/screens/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: [
            const IntroPage(),
            Container(
              color: Colors.accents[2],
            ),
            Container(
              color: Colors.accents[5],
            ),
          ],
        ),
      ),
    );
  }
}
