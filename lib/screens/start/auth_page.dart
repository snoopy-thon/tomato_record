import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomato_record/constants/common_size.dart';
import 'package:tomato_record/main.dart';
import 'package:tomato_record/states/user_provider.dart';

import '../../utils/logger.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

Duration duration = const Duration(milliseconds: 300);

class _AuthPageState extends State<AuthPage> {
  final inputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  );

  final TextEditingController _phoneNumberController =
      TextEditingController(text: "010");

  final TextEditingController _codeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        Size size = MediaQuery.of(context).size;
        return IgnorePointer(
          ignoring: _verificationStatus == VerificationStatus.verifying,
          child: Form(
            key: _formKey,
            child: Scaffold(
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
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _phoneNumberController,
                        inputFormatters: [
                          MaskedInputFormatter('000 0000 0000')
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          focusedBorder: inputBorder,
                          border: inputBorder,
                        ),
                        validator: (phoneNumber) {
                          if (phoneNumber != null && phoneNumber.length == 13)
                            return null;
                          else
                            // error
                            return '전화번호를 다시 입력해주세요!';
                        },
                      ),
                    ),
                    const SizedBox(
                      height: commonSmallPadding,
                    ),
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState != null) {
                          bool passed = _formKey.currentState!.validate();
                          print(passed);
                          if (passed) {
                            setState(() {
                              _verificationStatus = VerificationStatus.codeSent;
                            });
                          }
                        }
                      },
                      child: const Text(
                        '인증문자 발송',
                      ),
                    ),
                    const SizedBox(
                      height: commonPadding,
                    ),
                    AnimatedOpacity(
                      curve: Curves.easeInOut,
                      duration: duration,
                      opacity: (_verificationStatus == VerificationStatus.none)
                          ? 0
                          : 1,
                      child: AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: duration,
                        height: getVerificationHeight(_verificationStatus),
                        child: TextFormField(
                          controller: _codeController,
                          inputFormatters: [MaskedInputFormatter('000000')],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: inputBorder,
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      height: getVerificationBtnHeight(_verificationStatus),
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState != null) {
                            bool passed = _formKey.currentState!.validate();
                            if (passed) {
                              attemptVerifying();
                            }
                          }
                        },
                        child:
                            _verificationStatus == VerificationStatus.verifying
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('인증번호 확인'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void attemptVerifying() async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });

    context.read<UserProvider>().setUserState(true);
  }

  _getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? address = prefs.getString('address') ?? "";
    logger.d('Address from shared pref - $address');
  }

  double getVerificationBtnHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 45;
    }
  }

  double getVerificationHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 50 + commonSmallPadding;
    }
  }
}

enum VerificationStatus { none, codeSent, verifying, verificationDone }
