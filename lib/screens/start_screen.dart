import 'package:flutter/material.dart';
import 'package:tomato_record/screens/start/address_page.dart';
import 'package:tomato_record/screens/start/intro_page.dart';

import 'start/auth_page.dart';

class StartScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          // physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            IntroPage(_pageController),
            AddressPage(),
            AuthPage(),
          ],
        ),
      ),
    );
  }
}
