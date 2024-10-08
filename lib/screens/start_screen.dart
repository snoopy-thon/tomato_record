import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato_record/screens/start/address_page.dart';
import 'package:tomato_record/screens/start/intro_page.dart';

import 'start/auth_page.dart';

class StartScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 일반적으로는 그냥 Provider를 잘 사용하지 않음.
    // 그러나 우리는 다른 페이지에서 PageController를 접근할 수 있게만 하면 되기때문에 그냥 Provider를 사용.
    return Provider<PageController>.value(
      value:
          _pageController, // value를 사용하면 기존에 생성된 인스턴스를 사용할 수 있음(create는 새로 생성해야됨. 기존거 못씀)
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            // physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              IntroPage(),
              const AddressPage(),
              const AuthPage(),
            ],
          ),
        ),
      ),
    );
  }
}
