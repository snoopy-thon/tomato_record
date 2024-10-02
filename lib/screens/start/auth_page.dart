import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Verification'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset('assets/imgs/tomato.png'),
                ),
                const Flexible(
                    flex: 2,
                    child: Text(
                        'Sign up using your mobile number. Your number is securely stored and not shared with anyone else.')),
              ],
            ),
            TextFormField(
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
              padding: const EdgeInsets.symmetric(vertical: 15),
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
