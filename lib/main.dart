import 'package:firsttask/login_sreen.dart';
import 'package:firsttask/register_screen.dart';
import 'package:flutter/material.dart';

import 'flutter_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlutterList(),
      routes: {
        LoginScreen.routName: (context) => LoginScreen(),
        RegisterScreen.routName: (context) => RegisterScreen()
      },
    );
  }
}
