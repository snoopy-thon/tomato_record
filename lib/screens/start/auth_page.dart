import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:tomato_record/constants/common_size.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final inputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  );

  final TextEditingController _phoneNumberController =
      TextEditingController(text: "010");
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const Text('전화번호 로그인'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: Padding(
          padding: const EdgeInsets.all(commonPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                  ExtendedImage.asset(
                    'assets/imgs/padlock.png',
                    width: size.width * 0.15,
                    height: size.height * 0.15,
                ),
                  const SizedBox(
                    width: commonSmallPadding,
                  ),
                  const Text('''토마토 마켓은 휴대폰 번호로 가입해요.
번호는 안전하게 보관되며
어디에도 공개되지 않아요.'''),
              ],
            ),
              const SizedBox(
                height: commonPadding,
              ),
            TextFormField(
                  controller: _phoneNumberController,
                inputFormatters: [MaskedInputFormatter('000 0000 0000')],
                keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  focusedBorder: inputBorder,
                  border: inputBorder,
                hintText: 'Enter your mobile phone number.',
                ),
              ),
              const SizedBox(
                height: commonSmallPadding,
              ),
              FilledButton(
                onPressed: () {},
                child: const Text(
                  '인증문자 받기',
                ),
              ),
              const SizedBox(
                height: commonPadding,
              ),
              TextFormField(
                controller: _textEditingController,
                inputFormatters: [MaskedInputFormatter('000 0000 0000')],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: inputBorder,
                ),
              ),
              const SizedBox(
                height: commonSmallPadding,
                  ),
              FilledButton(
                onPressed: () {},
                child: const Text('인증번호 확인'),
            ),
          ],
        ),
      ),
    );
  }
}
