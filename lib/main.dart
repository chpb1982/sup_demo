import 'package:flutter/material.dart';
import 'package:sup_demo/views/homepage.dart';
import 'package:sup_demo/views/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Supplier List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      home: const HomeScreen(),
    );
  }
}
