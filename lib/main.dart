import 'package:flutter/material.dart';
import 'package:myflutterapp/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login/screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  void autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('email');

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
      });
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: buildThemeData(),
      debugShowCheckedModeBanner: false,
      home: !isLoggedIn ? LoginPage() : MainScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MainScreen()
      },
    );
  }
}
