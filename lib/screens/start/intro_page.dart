// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:tomato_record/constants/common_size.dart';

class IntroPage extends StatelessWidget {
  PageController controller;
  IntroPage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;

        final imgSize = size.width - 40;
        final sizeOfPosImg = imgSize * 0.1;

        return SafeArea(
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.all(commonPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '토마토마켓',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Stack(
                    children: [
                      ExtendedImage.asset('assets/imgs/carrot_intro.png'),
                      Positioned(
                        width: sizeOfPosImg,
                        left: imgSize * 0.45,
                        height: sizeOfPosImg,
                        top: imgSize * 0.45,
                        child: ExtendedImage.asset(
                            'assets/imgs/carrot_intro_pos.png'),
                      ),
                    ],
                  ),
                  const Text(
                    '우리 동네 중고 직거래 토마토마켓',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    '토마토마켓은 우리동네 직거래 마켓이에요.\n 내 동네를 설정하고 시작해보세요!',
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(commonPadding),
              child: FilledButton(
                style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
                onPressed: () {
                  controller.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: const Text(
                  '내 동네 설정하고 시작하기',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
