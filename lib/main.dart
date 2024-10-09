import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tomato_record/router.dart';
import 'package:tomato_record/router/locations.dart';
import 'package:tomato_record/screens/start_screen.dart';
import 'package:tomato_record/screens/splash_screen.dart';
import 'package:tomato_record/utils/logger.dart';

import 'screens/home_screen.dart';

void main() {
  logger.d('My first log by logger!!');
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print('error occur while loading');
      return const Text('Error occur');
    } else if (snapshot.hasData) {
      return const TomatoApp();
    } else {
      return const SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          lazy: false,
          create: (context) => UserProvider(),
        ),
        Provider(
          lazy: false,
          create: (context) {
            final UserProvider loginState = context.read<UserProvider>();
            return MyRouter(loginState);
          },
        ),
      ],
      child: Builder(builder: (context) {
        final router = Provider.of<MyRouter>(context, listen: false).router;
    return MaterialApp.router(
      theme: ThemeData(
            useMaterial3: false, // appbar 색상 변경하기 위해 추가
        fontFamily: 'DoHyeon',
        hintColor: Colors.grey[350],
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
            textTheme: const TextTheme(
              labelLarge: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
              bodyMedium: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
                minimumSize: const Size(48, 48),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 2,
          backgroundColor: Colors.white,
              actionsIconTheme: IconThemeData(color: Colors.black87),
        ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.black26,
            ),
      ),
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
        );
      }),
    );
  }
}
