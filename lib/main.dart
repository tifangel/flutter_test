import 'package:flutter/material.dart';
import 'package:myflutterapp/providers/user_operations.dart';
import 'package:myflutterapp/theme.dart';
import 'package:provider/provider.dart';

import 'screens/login/screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserOperation()),
        ],
        builder: (context, child) {
          var u = Provider.of<UserOperation>(context);

          return MaterialApp(
            title: 'Food App',
            theme: buildThemeData(),
            debugShowCheckedModeBanner: false,
            home: u.getUser.email.isEmpty && u.getUser.password.isEmpty
                ? LoginPage()
                : MainScreen(),
            routes: {
              '/login': (context) => LoginPage(),
              '/home': (context) => MainScreen()
            },
          );
        });
  }
}
