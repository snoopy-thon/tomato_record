import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  bool _userLoggedIn = false;

  void setUserState(bool authState) {
    _userLoggedIn = authState;
    notifyListeners();
  }

  bool get userState => _userLoggedIn;
}
