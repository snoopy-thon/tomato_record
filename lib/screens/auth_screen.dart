import 'package:flutter/material.dart';
import 'package:tomato_record/screens/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            IntroPage(_pageController),
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
