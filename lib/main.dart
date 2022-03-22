import 'package:flutter/material.dart';
import 'package:netflix_clone/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
