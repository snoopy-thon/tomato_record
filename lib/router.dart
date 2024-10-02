import 'package:go_router/go_router.dart';
import 'package:tomato_record/screens/home_screen.dart';

import 'screens/start_screen.dart';
import 'screens/error_page.dart';
import 'screens/splash_screen.dart';

class MyRouter {
  final loginState;
  MyRouter(this.loginState);

  late final router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return ErrorPage(
        error: state.error,
      );
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, GoRouterState state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/start',
        builder: (context, GoRouterState state) => StartScreen(),
      ),
    ],
    redirect: (context, state) {
      if (loginState)
        return '/';
      else
        return '/start';
    },
  );
}
