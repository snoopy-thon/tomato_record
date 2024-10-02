import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomato_record/constants/common_size.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final TextEditingController _textEditingController =
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
                  const Text('''토마토 마켓은 휴대폰 번호로 가입해요.
번호는 안전하게 보관되며
어디에도 공개되지 않아요.'''),
              ],
            ),
            TextFormField(
                controller: _textEditingController,
                inputFormatters: [MaskedInputFormatter('000 0000 0000')],
                keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey[350]!,
                )),
                hintText: 'Enter your mobile phone number.',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: commonPadding),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: Text('Send code',
                    style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
            const Text(
              'Changed number? Find account by email',
              textAlign: TextAlign.center,
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
