import 'package:flutter/material.dart';
import 'package:flutter_tiktok/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter TikTok',
        theme: ThemeData.dark(),
        home: Scaffold(body: HomeScreen()));
  }
}
