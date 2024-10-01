import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Exception? error;
  late String message;
  ErrorPage({super.key, this.error}) {
    if (error != null) {
      message = error.toString();
    } else {
      message = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
