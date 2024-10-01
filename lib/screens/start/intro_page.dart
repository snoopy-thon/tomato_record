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
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ExtendedImage.asset('assets/imgs/carrot_intro.png'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: const Text(
                '우리 동네 중고 직거래 토마토마켓',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Text(
              '토마토마켓은 우리동네 직거래 마켓이에요.\n 내 동네를 설정하고 시작해보세요!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FilledButton(
          style: ButtonStyle(
            //backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
          ),
          onPressed: () {},
          child: const Text(
            '내 동네 설정하고 시작하기',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
