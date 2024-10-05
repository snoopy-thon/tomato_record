import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato_record/states/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<UserProvider>().setUserState(false);
            },
          ),
        ],
      ),
    );
  }
}
