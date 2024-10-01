import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
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
            const SizedBox(
              height: 40,
            ),
            Stack(
              children: [
                ExtendedImage.asset('assets/imgs/carrot_intro.png'),
                Positioned(
                  left: 50,
                  right: 50,
                  top: 50,
                  bottom: 50,
                  child:
                      ExtendedImage.asset('assets/imgs/carrot_intro_pos.png'),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: const Text(
                '우리 동네 중고 직거래 토마토마켓',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
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
        padding: const EdgeInsets.all(15.0),
        child: FilledButton(
          style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          //backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          onPressed: () {},
          child: const Text(
            '내 동네 설정하고 시작하기',
          ),
        ),
      ),
    );
  }
}
