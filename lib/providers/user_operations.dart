import 'package:flutter/cupertino.dart';
import 'package:myflutterapp/model/auth_user.dart';

class UserOperation extends ChangeNotifier {
  AuthUser _user = AuthUser('', '');

  AuthUser get getUser => _user;

  void signIn(String email, String pwd) {
    _user = AuthUser(pwd, email);
    notifyListeners();
  }
}
