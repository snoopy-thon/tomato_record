import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato_record/states/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '신봉동',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<UserProvider>().setUserState(false);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('$_selectedIndex'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.apartment), label: '동네생활'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
        ],
        //showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // unselectedItemColor: Colors.grey[350],
        // selectedItemColor: Theme.of(context).colorScheme.primary,
        // unselectedLabelStyle: TextStyle(color: Colors.grey[350]),
      ),
    );
  }
}
